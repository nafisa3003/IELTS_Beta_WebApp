<?php
require_once '../includes/config.php';
$user=auth_required(); $uid=$user['id'];
$action=$_GET['action']??'get';
if($action==='get'){
  unset($user['password']);
  $skills=query('SELECT * FROM skill_progress WHERE user_id=?',[$uid]);
  $history=query('SELECT * FROM test_attempts WHERE user_id=? ORDER BY completed_at DESC LIMIT 10',[$uid]);
  json_response(['user'=>$user,'skills'=>$skills,'test_history'=>$history]);
}
if($action==='update'&&$_SERVER['REQUEST_METHOD']==='POST'){
  $d=json_decode(file_get_contents('php://input'),true);
  $fields=[]; $params=[];
  if(isset($d['name'])){$fields[]='name=?';$params[]=trim($d['name']);}
  if(isset($d['target_band'])){$fields[]='target_band=?';$params[]=floatval($d['target_band']);}
  if(isset($d['current_band'])){$fields[]='current_band=?';$params[]=floatval($d['current_band']);}
  if(isset($d['test_date'])){$fields[]='test_date=?';$params[]=$d['test_date']?:null;}
  if(isset($d['theme'])){$fields[]='theme=?';$params[]=in_array($d['theme'],['light','dark'])?$d['theme']:'light';}
  if(empty($fields))json_response(['error'=>'Nothing to update.'],422);
  $params[]=$uid;
  execute('UPDATE users SET '.implode(',',$fields).' WHERE id=?',$params);
  json_response(['success'=>true]);
}
if($action==='change_password'&&$_SERVER['REQUEST_METHOD']==='POST'){
  $d=json_decode(file_get_contents('php://input'),true);
  $new_p=$d['new_password']??'';
  if(strlen($new_p)<6)json_response(['error'=>'Password must be at least 6 characters.'],422);
  execute('UPDATE users SET password=? WHERE id=?',[hash_password($new_p),$uid]);
  json_response(['success'=>true]);
}
if($action==='delete'&&$_SERVER['REQUEST_METHOD']==='DELETE'){
  execute('DELETE FROM users WHERE id=?',[$uid]); session_destroy();
  json_response(['success'=>true]);
}
json_response(['error'=>'Unknown action.'],400);
