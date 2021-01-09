<?php

/**
 *  
 * @file   admin.php  
 * @date   2016-8-30 15:22:57 
 * @author Zhenxun Du<5552123@qq.com>  
 * @version    SVN:$Id:$ 
 */

namespace app\admin\model;

use think\Db;

class Dormanage extends \think\Model {

    public $status = array(1 => '无效', 2 => '有效');

    public function getInfo($id) {
        $res = db('ms_activity')->field('id,activity_name,product_name,price,total,start_time,end_time,status,buy_limit,lastloginip,lastlogintime')->where(array('id' => $id))->find();
        

        return $res;
    }

    /**
     * 
     * @param int $userid 用户ID
     * @return Array
     */


    /**
     * 登陆更新
     * @param int $type 1:登陆更新,2:信息更新
     * @param int $id id
     * @param array $data 更新的数据
     */
   public function editInfo($type, $id, $data = array()) {
        
        if ($type == 1) {
            $data['lastlogintime'] = time();
            $data['lastloginip'] = ip2long(request()->ip());
        } elseif ($type == 2) {
            $data['lastlogintime'] = time();
            $data['lastloginip'] = ip2long(request()->ip());
        }
        $res = $this->allowField(true)->save($data, ['id' => $id]);

        return $res;
    }

}
