package com.example.runnertracker;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.util.Base64;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.kakao.sdk.auth.model.OAuthToken;
import com.kakao.sdk.user.UserApiClient;
import com.kakao.sdk.user.model.User;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;

public class LoginActivity extends AppCompatActivity {
    private final static String TAG = "유저";
    public static Context mContext;
    private SharedPreferences sharedPreferences;
    private User currentUser;
    private String userImageString = "";
    private Bitmap mBitmap;
    SharedPreferences.Editor editor;
    private Boolean isTrue = false;
    private Boolean nextIntent = false;
    private String meetingId;
    private Intent intent;

    @Override
    public void onCreate(Bundle savedInstanceState) {

        String result=null;
        super.onCreate(savedInstanceState);
        setContentView(R.layout.login);


        //////////////////////////////////////////////////////////////////////

        Button button = (Button)findViewById(R.id.loginbutton);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                generalLogin();
            }
        });

        ImageButton kakao_login_button = (ImageButton)findViewById(R.id.kakaoLogin);
        kakao_login_button.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v) {
                kakaoLogin();
            }
        });
    }

    public void generalLogin(){
        String result=null;
        EditText input_id = (EditText)findViewById(R.id.login_id);
        EditText input_password = (EditText)findViewById(R.id.login_password) ;

        String id = input_id.getText().toString();
        String password = input_password.getText().toString();
        Log.d("로그인 결과아이디", id);
        Log.d("로그인 결과아이디", password);
        try{
            result= new TaskLogin().execute(id,password).get();
            Log.d("로그인 결과아이디", result);
        }catch (Exception e){
            e.printStackTrace();
        }
        Log.d("로그인 결과", result);
        if(result.equals("true")) {
            ((GlobalApplication) getApplication()).setId(id);
            Log.d("로그인 결과아이디", ((GlobalApplication) getApplication()).getId());
            Intent login = new Intent(LoginActivity.this, MainActivity.class);
            startActivity(login);
        }else{
            new AlertDialog.Builder(LoginActivity.this)
                    .setMessage("아이디와 비밀번호를 확인해 주세요")
                    .setPositiveButton("확인", new DialogInterface.OnClickListener() {
                        public void onClick(DialogInterface dialog, int which){
                            Toast.makeText(getApplicationContext(), "확인 누름", Toast.LENGTH_SHORT).show(); // 실행할 코드
                        }
                    })
                    .show();

        }



    }

    public void kakaoLogin(){
        if(UserApiClient.getInstance().isKakaoTalkLoginAvailable(LoginActivity.this)){
            login();
        }
        else{
            accountLogin();
        }
    }

    public void login(){
        String TAG = "login()";
        Log.e(TAG, "login 들어옴");
        UserApiClient.getInstance().loginWithKakaoTalk(LoginActivity.this,(oAuthToken, error) -> {
            if (error != null) {
                Log.e(TAG, "로그인 실패", error);
            } else if (oAuthToken != null) {
                Log.i(TAG, "로그인 성공(토큰) : " + oAuthToken.getAccessToken());
                getUserInfo();
            }
            return null;
        });
    }

    public void accountLogin(){
        String TAG = "accountLogin()";
        UserApiClient.getInstance().loginWithKakaoAccount(LoginActivity.this,(oAuthToken, error) -> {
            if (error != null) {
                Log.e(TAG, "로그인 실패", error);
            } else if (oAuthToken != null) {
                Log.i(TAG, "로그인 성공(토큰) : " + oAuthToken.getAccessToken());
                getUserInfo();
            }
            return null;
        });
    }

    public void getUserInfo(){
        String TAG = "getUserInfo()";
        UserApiClient.getInstance().me((user, meError) -> {
            if (meError != null) {
                Log.e(TAG, "사용자 정보 요청 실패", meError);
            } else {
                System.out.println("로그인 완료");
                Log.i(TAG, user.toString());
                {
                    Log.i(TAG, "사용자 정보 요청 성공" +
                            "\n회원번호: "+user.getId() +
                            "\n이메일: "+user.getKakaoAccount().getEmail());
                }
                String result=null;
                String email =user.getKakaoAccount().getEmail();
                try{
                    result = new TaskKakaoLogin().execute(email).get();
                }catch (Exception e){
                    e.printStackTrace();
                }
                if(result.equals("true")) {
                    ((GlobalApplication) getApplication()).setId(user.getKakaoAccount().getEmail());
                    Intent login = new Intent(LoginActivity.this, MainActivity.class);
                    startActivity(login);
                }else{
                    new AlertDialog.Builder(LoginActivity.this)
                            .setMessage("아이디와 비밀번호를 확인해 주세요")
                            .setPositiveButton("확인", new DialogInterface.OnClickListener() {
                                public void onClick(DialogInterface dialog, int which){
                                    Toast.makeText(getApplicationContext(), "확인 누름", Toast.LENGTH_SHORT).show(); // 실행할 코드
                                }
                            })
                            .show();

                }

            }
            return null;
        });
    }




}



