package top.yanchengxu.bean;

import com.sun.deploy.security.MozillaSSLRootCertStore;
import javafx.beans.binding.ObjectExpression;

import java.util.HashMap;

public class Message {

    // 状态码 200:成功 500:失败
    private int code;
    // 提示信息
    private String msg;

    private HashMap<String, Object> extend = new HashMap<String, Object>();

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public HashMap<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(HashMap<String, Object> extend) {
        this.extend = extend;
    }


    public static Message succeed() {
        Message result = new Message();
        result.setCode(200);
        result.setMsg("成功");
        return result;
    }


    public static Message fail() {
        Message result = new Message();
        result.setCode(500);
        result.setMsg("失败");
        return result;
    }

    public Message add(String key, Object val) {
        this.getExtend().put(key, val);
        return this;

    }
}
