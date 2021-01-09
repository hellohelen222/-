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

class Dorm extends Common {
    /*

    public function index() {
        
        $where = array();
        if ($group_id = input('group_id')) {
            $where['t2.group_id'] = $group_id;
            
        }
        $lists = db('stumanage')->alias('t1')->field('t1.*')
                ->where($where)
                ->join(config('database.prefix').'admin_group_access t2', 't1.id=t2.uid', 'left')
                ->group('t1.id')
                ->order('t1.id desc')
                ->select();
     
        foreach ($lists as $k => $v) {
            //取出组名
            $lists[$k]['groups'] = '';
            $groups = Loader::model('Admin')->getUserGroups($v['id']);
            if ($groups) {
                $tmp = db('admin_group')->field('name')->where('id', 'in', $groups)->select();

                foreach ($tmp as $vv) {
                    $lists[$k]['groups'] .= $vv['name'] . ',';
                }
                $lists[$k]['groups'] = trim($lists[$k]['groups'], ',');
            }
        }

        $this->assign('lists', $lists);
        return $this->fetch();
    }
    */
    
    public function lists() {
        $lists = db('ms_activity')->select();
        //var_dump($lists);
        $this->assign("lists", $lists);
        return $this->fetch();
        
        }

    /*
     * 查看
     */

   

    

   
}
