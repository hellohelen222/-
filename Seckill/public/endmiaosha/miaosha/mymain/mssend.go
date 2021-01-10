

package main

import (
	"encoding/json"
	"fmt"
	"net/rpc"
	"net/rpc/jsonrpc"
	"os"

	"github.com/streadway/amqp"

	"log"
	"math/rand"
	"net"

	"strconv"
	"strings"
	"time"
)
type Datas struct {
	Order_sn   string     `json:"order_sn"`
	User_id int  `json:"user_id"`
	Goods_id  int      `json:"goods_id"`
	Count   int     `json:"count"`


}

type RpcService struct {
}

//请求数据结构体
type RequestData struct {
	dtype int
	order_sn string
	user_id int
	goods_id int
	count int

}


// 响应数据结构体
type ResponseData struct {
	Status int // 状态
	Data interface{} //数据
	Msg string //说明
}

//_______>

func failOnError(err error, msg string) {
	if err != nil {
		log.Fatalf("%s: %s", msg, err)
	}
}

//生成单号
//06123xxxxx
//sum 最少10位,sum 表示全部单号位数
func MakeYearDaysRand(sum int) string {
	//年
	strs := time.Now().Format("06")
	//一年中的第几天
	days := strconv.Itoa(GetDaysInYearByThisYear())
	count := len(days)
	if count < 3 {
		//重复字符0
		days = strings.Repeat("0", 3-count) + days
	}
	//组合
	strs += days
	//剩余随机数
	sum = sum - 5
	if sum < 1 {
		sum = 5
	}
	//0~9999999的随机数

	//pow := math.Pow(10, float64(sum)) - 1
	//fmt.Println("sum=>", sum)
	//fmt.Println("pow=>", pow)
	result := strconv.Itoa(rand.Intn(1000))
	count = len(result)
	//fmt.Println("result=>", result)
	if count < sum {
		//重复字符0
		result = strings.Repeat("0", sum-count) + result
	}
	//组合
	strs += result
	return strs
}

//年中的第几天
func GetDaysInYearByThisYear() int {
	now := time.Now()
	total := 0
	arr := []int{31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}
	y, month, d := now.Date()
	m := int(month)
	for i := 0; i < m-1; i++ {
		total = total + arr[i]
	}
	if (y%400 == 0 || (y%4 == 0 && y%100 != 0)) && m > 2 {
		total = total + d + 1

	} else {
		total = total + d
	}
	return total
}

var user_id int
var goods_id int
var count int
//var order_sn string
// 方法（必须是公有方法，且必须是两个参数）
func (this *RpcService  ) Order(request map[string]int  , response *ResponseData ) error {
	m := map[string]string{"type":"10","msg":"hello."}
	//mjson,_ :=json.Marshal(m)
	//mString :=string(mjson)
	/*
	response.Status = 1
	fmt.Print("hahahhahhah")
	fmt.Print(request.dtype)
	order_sn=request.order_sn
	fmt.Print(order_sn)
	user_id=request.user_id
	fmt.Print(user_id)
	goods_id=request.goods_id
	fmt.Print(goods_id)
	count=request.count
	fmt.Print(count)
	*/



	fmt.Print("hahahhahhah")
	fmt.Print(request["dtype"])
	//order_sn=strconv.Itoa(request["order_sn"])
	//fmt.Print(order_sn)
	count=request["count"]
	fmt.Print(count)
	user_id=request["user_id"]
	fmt.Print(user_id)
	goods_id=request["goods_id"]
	fmt.Print(goods_id)


	response.Data = m
	response.Msg = "success"
	return nil
}





func main() {

	_ = rpc.Register(new(RpcService )) // 注册rpc服务
	lis, err := net.Listen("tcp", "127.0.0.1:5052") //监听端口，如果监听所有客户端则去掉ip
	if err != nil {
		log.Fatalln("fatal error: ", err)
	}

	_, _ = fmt.Fprintf(os.Stdout, "%s", "jsonrpc is started\n")

	for {
		conn, err := lis.Accept() // 接收客户端连接请求
		if err != nil {
			continue
		}
		go func(conn net.Conn) { // 并发处理客户端请求
			_, _ = fmt.Fprintf(os.Stdout, "%s", "new client connect\n")
			jsonrpc.ServeConn(conn)

			con, err := amqp.Dial("amqp://admin:admin@localhost:5672")
			failOnError(err, "Failed to connect to RabbitMQ")
			defer con.Close()

			ch, err := con.Channel()
			failOnError(err, "Failed to open a channel")
			defer ch.Close()

			q, err := ch.QueueDeclare(
				"miaoshaqueue", // name
				false,   // durable
				false,   // delete when unused
				false,   // exclusive
				false,   // no-wait
				nil,     // arguments
			)
			failOnError(err, "Failed to declare a queue")

			//var  currentTime string = time.Now()

			datas:=Datas{}
			datas.Order_sn=MakeYearDaysRand(24)
			datas.Count=count

			datas.User_id=user_id
			datas.Goods_id=goods_id



			//datas.Created_at=time.Now()
			bchars, err := json.Marshal(datas)


			body := bchars

			err = ch.Publish(
				"",     // exchange
				q.Name, // routing key
				false,  // mandatory
				false,  // immediate
				amqp.Publishing{
					ContentType: "text/plain",
					Body:        []byte(body),
					//Body:        []byte(s),
				})
			log.Printf(" [x] Sent %s", body)
			failOnError(err, "Failed to publish a message")

		}(conn)
	}




/*

	conn, err := amqp.Dial("amqp://admin:admin@localhost:5672")
	failOnError(err, "Failed to connect to RabbitMQ")
	defer conn.Close()

	ch, err := conn.Channel()
	failOnError(err, "Failed to open a channel")
	defer ch.Close()

	q, err := ch.QueueDeclare(
		"miaoshaqueue", // name
		false,   // durable
		false,   // delete when unused
		false,   // exclusive
		false,   // no-wait
		nil,     // arguments
	)
	failOnError(err, "Failed to declare a queue")

	//var  currentTime string = time.Now()

	datas:=Datas{}
	datas.Order_sn=order_sn
	datas.Count=count
	datas.Status=1
	datas.User_id=user_id
	datas.Goods_id=goods_id



	//datas.Created_at=time.Now()
	bchars, err := json.Marshal(datas)


	body := bchars

	err = ch.Publish(
		"",     // exchange
		q.Name, // routing key
		false,  // mandatory
		false,  // immediate
		amqp.Publishing{
			ContentType: "text/plain",
			Body:        []byte(body),
			//Body:        []byte(s),
		})
	log.Printf(" [x] Sent %s", body)
	failOnError(err, "Failed to publish a message")

*/
}