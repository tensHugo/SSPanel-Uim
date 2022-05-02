<?php



namespace App\Controllers;

use App\Models\{
    LegalizeLog,
    User
};

use Slim\Http\{
    Request,
    Response
};



class LegalizeController extends BaseController
{
    public function notifyUrl($request, $response, $args)
    {

        $param = urldecode($request->getBody());
        file_put_contents("legalizeNotifyUrl.json",$param); //临时记录日志

        $param = explode("=", $param, 2);

        list($data, $sign) = explode("}", $param[1], 2);
        $data = json_decode($data . "}");

        $rzlog = LegalizeLog::where('bizNo',$data->bizNo)->first();
        if($data->code=='PASS'){
            $rzlog->paperworkNo = $data->id;
            $rzlog->name = $data->name;
            $rzlog->gender = $data->gender;
            $rzlog->address = $data->address;
            $rzlog->pw_pic = $data->idFront;
            $rzlog->pw_pic1 = $data->idBack;
            $rzlog->pw_video = $data->videoUrl;
            $rzlog->pw_image = $data->imgUrl;
            $rzlog->status = '1';
        }else{
            $rzlog->status = '-1';
        }

        $rzlog->err_msg = $data->msg;
        $rzlog->up_time = time();

        if($rzlog->save() && $data->code=='PASS'){
            User::find($rzlog->user_id)->legalize($data->name);
        }

        $res['code'] = 1;
        $res['msg'] = '回调处理成功！';
        $res['notifyUrl'] = $_ENV['baseUrl'] . '/legalize/notifyUrl';
        return $response->withJson($res);

    }

    public function returnUrl($request, $response, $args)
    {

        $param = urldecode($request->getBody());
        file_put_contents("legalizeReturnUrl.json",$param);

        $param = explode("=", $param, 2);

        list($data, $sign) = explode("}", $param[1], 2);
        $data = json_decode($data . "}");


        return $this->view()
        ->assign('code',$data->code)
        ->assign('msg',$data->msg)
        ->display('legalize/return_url.tpl');

    }


}
