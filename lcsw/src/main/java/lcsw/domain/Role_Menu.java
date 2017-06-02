package lcsw.domain;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

@TableName("role_menu")
public class Role_Menu {
	
	@TableId("id")
	private Integer id;
	
	@TableField("role_id")
	private Integer roleId;
	
	@TableField("menu_id")
	private Integer menuId;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public Integer getMenuId() {
		return menuId;
	}

	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
	}

	@Override
	public String toString() {
		return "Role_Menu [id=" + id + ", roleId=" + roleId + ", menuId=" + menuId + "]";
	}
	
	
	
}
