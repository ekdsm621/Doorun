package com.example.runnertracker;

import android.app.Application;

import com.kakao.sdk.common.KakaoSdk;


public class GlobalApplication extends Application {

    private String id;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Override
    public void onCreate() {
        super.onCreate();
        KakaoSdk.init(this,"da41b54f20bac5b05fc6d7ebf7c959ef");
    }
}
