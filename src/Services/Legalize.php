<?php

namespace App\Services;

use App\Models\Setting;

class Legalize
{

    public static function verified($bizNo){
        $host = "https://faceidh5.market.alicloudapi.com";
        $path = "/edis_ctid_id_name_video_ocr_h5";
        $method = "POST";
        $appcode = "b74cc454ba11442da64d701814eea038";
        $pageTitle = "公安一所CTID实人认证系统";
        $notifyUrl = $_ENV['baseUrl'] . '/legalize/notifyUrl';  //认证回调
        $returnUrl = $_ENV['baseUrl'] . '/legalize/returnUrl';  //认证完成返回页面
        

        $headers = array();
        array_push($headers, "Authorization:APPCODE " . $appcode);
        //根据API的要求，定义相对应的Content-Type
        array_push($headers, "Content-Type".":"."application/x-www-form-urlencoded; charset=UTF-8");
        $querys = "";
        $bodys = "bizNo=" . $bizNo . "&notifyUrl=" . $notifyUrl . "&ocrOnly=true&pageTitle=".$pageTitle."&retIdImg=true&returnImg=true&returnLiveVideo=true&returnUrl=" . $returnUrl;
        $url = $host . $path;

        $curl = curl_init();
        curl_setopt($curl, CURLOPT_CUSTOMREQUEST, $method);
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($curl, CURLOPT_FAILONERROR, false);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_HEADER, true);
        if (1 == strpos("$".$host, "https://"))
        {
            curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
        }
        curl_setopt($curl, CURLOPT_POSTFIELDS, $bodys);

        $re = curl_exec($curl);
        list($header, $body) = explode("\r\n\r\n", $re, 2);

        //file_put_contents("legalize.txt",$body);
        return json_decode($body);
    }


}
