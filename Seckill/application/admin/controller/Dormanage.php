<?php

/**
 *  后台继承类
 * @file   Admin.php  
 * @date   2016-8-23 19:45:21 
 * @author Zhenxun Du<5552123@qq.com>  
 * @version    SVN:$Id:$ 
 */

namespace app\admin\controller;

use think\Loader;

class Dormanage extends Common {
    

    public function index() {
        
        
        
        $lists = db('ms_activity')->select();
        $this->assign('lists', $lists);
        return $this->fetch();
    }
    
    


    /*
     * 查看
     */

    public function info() {
         $id = input('id');
        if ($id) {
            //当前用户信息
            $info = model('Dormanage')->getInfo($id);
            //$info['userGroups'] = Loader::model('Dormanage')->getUserGroups($id);
            $this->assign('info', $info);
        }

        //所有组信息
        //$groups = model('AdminGroup')->getGroups();

        //$this->assign('groups', $groups);
        return $this->fetch();
    }

    /*
     * 添加
     */

    public function add() {
        $data = input();
        $count = db('ms_activity')->where('product_name', $data['product_name'])->count();

        if ($count) {
            $this->error('商品已存在');
        }
        
        


        $res = db('ms_activity')->insert($data);
        

        if ($res) {
            /*
            
                $uid = model('Dormanage')->id;
                $urname = model('Dormanage')->realname;
                $stuid = model('Dormanage')->stuID;
                $sex = model('Dormanage')->sex;
                $Building = model('Dormanage')->Building;
                $Floor = model('Dormanage')->Floor;
                $Unit=model('Dormanage')->Unit;
                $Bed=model('Dormanage')->Bed;
               
                    db('stumanage')->insert(['id' => $uid, 'realname' => $urname,'stuID' => $stuid,'sex' => $sex,'Building' => $Building,'Floor' => $Floor,'Unit' => $Unit,'Bed' => $Bed]);
                
                */
            
            $this->success('操作成功', url('index'));
        } else {
            $this->error('操作失败');
        }
    }

    /*
     * 修改
     */

    public function edit() {
        $data = input();
        db('ms_activity')->where(['id' => $data['id']])->delete();

        $res = Loader::model('Dormanage')->editInfo(2, $data['id'], $data);

        if ($res) {
            $this->success('操作成功');
        } else {
            $this->error('操作失败');
        }
    }

    /*
     * 删除
     */

    public function del() {
        $id = input('id');
        $res = db('ms_activity')->where(['id' => $id])->delete();
        if ($res) {
            
            $this->success('操作成功', url('index'));
        } else {
            $this->error('操作失败');
        }
    }

    
}
