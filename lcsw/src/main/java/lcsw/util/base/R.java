package lcsw.util.base;

import java.util.HashMap;
import java.util.Map;

public class R extends HashMap<String,Object>{
	
	public R() {
		put("code", 0);
	}
	
	public static R error() {
		return error(500, "未知异常，请联系管理员");
	}
	
	public static R error(String msg) {
		return error(500, msg);
	}
	
	public static R error(int code, String msg) {
		R r = new R();
		r.put("code", code);
		r.put("msg", msg);
		r.put("status", false);
		return r;
	}
	
	public static R ok(Map<String, Object> map) {
		R r = new R();
		r.putAll(map);
		r.put("status", true);
		return r;
	}
	
	public static R ok(){
		R r = new R();
		r.put("status", true);
		return r;
	}
	
	public R put(String key, Object value) {
		super.put(key, value);
		return this;
	}
	
}
