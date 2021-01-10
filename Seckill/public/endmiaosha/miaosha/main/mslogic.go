package main

import (
	"encoding/json"
	"fmt"
	"github.com/pkg/errors"
	"github.com/streadway/amqp"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	"log"
)

//Order ...
type Order struct {
	ID           int    `gorm:"primaryKey"`
	Order_sn   string    `gorm:"column:order_sn"`
	User_id int  `gorm:"column:user_id"`
	Goods_id int `gorm:"column:goods_id"`
	Count int  `gorm:"column:count"`
	Status       int    `gorm:"column:status"` //0 用户不可见
	Price int  `gorm:"column:price"`
	Createdat     string  `gorm:"column:created_at"`

}

//Product
type Product struct {
	ID           int    `gorm:"primaryKey"`
	Product_id   int    `gorm:"column:product_id"`
	Total     int  `gorm:"column:total"`
	Status       int    `gorm:"column:status"` //0 用户不可见
	Price       int    `gorm:"column:price"`

}
//Log
type Log struct {
	ID           int    `gorm:"primaryKey"`
	Msg     string  `gorm:"column:msg"`
	Status      int  `gorm:"column:status"`
	Createdat     string  `gorm:"column:created_at"`

}

type Datas struct {
	Order_sn   string     `json:"order_sn"`
	User_id int  `json:"user_id"`
	Goods_id  int      `json:"goods_id"`
	Count   int     `json:"count"`



}


func failOnError(err error, msg string) {
	if err != nil {
		log.Fatalf("%s: %s", msg, err)
	}
}



func main() {

	conn, err := amqp.Dial("amqp://admin:admin@localhost:5672/")
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

	msgs, err := ch.Consume(
		q.Name, // queue
		"",     // consumer
		true,   // auto-ack
		false,  // exclusive
		false,  // no-local
		false,  // no-wait
		nil,    // args
	)
	failOnError(err, "Failed to register a consumer")

	forever := make(chan bool)



	go func() {
		for d := range msgs {
			log.Printf("Received a message: %s", d.Body)

			var datas Datas

			//fmt.Println(product_id)
			err := json.Unmarshal([]byte(d.Body), &datas)
			if err != nil {
				fmt.Println(err)
			}
			count:= datas.Count
			//fmt.Println(count)
			productid:= datas.Goods_id
			fmt.Println("11111")
			//fmt.Println(productid)
			dsn := "sql81_70_222_94:prS5scEHds@tcp(127.0.0.1:3306)/sql81_70_222_94?charset=utf8mb4&parseTime=True"

			//var stuID=[4]int{2001210111,2001210333,2001210444,2001210666}


			//连接数据库

			db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{})
			if err != nil {
				fmt.Println(err)
			}else{
				fmt.Println("------------连接数据库成功-----------")

			}

			isok := 0
			var total int
			var price int
			// 取出产品总数
			product := Product{}
			errProduct := db.Table("ms_activity").Where(" status = 1").Where(" product_id = ?", productid).First(&product).Error
			if errors.Is(errProduct, gorm.ErrRecordNotFound) {
				fmt.Println("该产品并未参与活动")
			} else {
				fmt.Println(product.Total)
				total=product.Total
				price=product.Price
				if(product.Total-count>0){
					isok=1
				}else{
					fmt.Println("已无库存")
					var log0=Log{Status:0,Msg:"已无库存"}
					db.Table("ms_order_log").Create(&log0)

				}
			}

			// 开始事务
			tx := db.Begin()

			if isok == 1 {

				//var  currentTime  = int(time.Now().Unix())

				var data=Order{Order_sn:datas.Order_sn,User_id:datas.User_id,Status:1,Goods_id:datas.Goods_id,Count:datas.Count,Price:price}
				db.Table("ms_order").Create(&data)
				//res,err :=db.Exec("insert into ms_order(order_sn, user_id,status,goods_id,count,price)values(?, ?,?,?,?,?)", datas.Order_sn, datas.User_id,1,datas.Goods_id,total-datas.Count,datas.Price)

				//numinserted, err := res.RowsAffected()
				/*
					if err !=nil {
						fmt.Println("插入order失败", err)
						return
					}
					fmt.Println(numinserted)
					fmt.Println("插入order成功")
				*/

				db.Table("ms_activity").Where(" product_id = ? ", datas.Goods_id).Update("total",total-datas.Count)
				//err1 :=db.Exec("UPdate user set total=total-? where product_id=? ",datas.Count,datas.Goods_id)

			} else {
				// 如果未找到
				fmt.Println("现有商品数量无法满足")
				var log1=Log{Status:0,Msg:"已无库存"}
				db.Table("ms_order_log").Create(&log1)

			}

			// 否则，提交事务
			tx.Commit()
			//var  currentTime  = time.Now()
			fmt.Println("下单成功")
			var log2=Log{Status:1,Msg:"下单成功"}
			db.Table("ms_order_log").Create(&log2)




		}

	}()

	log.Printf(" [*] Waiting for messages. To exit press CTRL+C")
	<-forever





}

