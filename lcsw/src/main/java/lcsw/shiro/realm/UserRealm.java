package lcsw.shiro.realm;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import lcsw.domain.User;
import lcsw.service.MenuService;
import lcsw.service.UserService;

public class UserRealm extends AuthorizingRealm{
	
	@Resource
	private UserService userService;
	@Resource
	private MenuService menuService;

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		User user =  (User)principals.getPrimaryPrincipal();
		Integer id = user.getId();
		
		List<String> permsList = new ArrayList<String>();
		
		if(id == 1){
			permsList = menuService.selectAllPerms();
		}else{
			permsList = userService.selectPermsByUserId(id);
		}
		
		//用户权限列表
		Set<String> permsSet = new HashSet<String>();
		for(String perms : permsList){
			if(StringUtils.isBlank(perms)){
				continue;
			}
			permsSet.addAll(Arrays.asList(perms.trim().split(",")));
		}
		
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		info.setStringPermissions(permsSet);
		return info;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		String userName = (String) token.getPrincipal();
		String password = new String((char[]) token.getCredentials());
		
		List<User> users =  userService.findByName(userName);
        //账号不存在
        if(users.size() == 0) {
            throw new UnknownAccountException("账号不存在");
        }else{
            User user = users.get(0);
            //密码错误
            if(!password.equals(user.getPassword())) {
                throw new IncorrectCredentialsException("密码不正确");
            }
            
            SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(user, password, getName());
            return info;
        }
	}


}
