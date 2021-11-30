package com.softlab.okr.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * <p>
 *
 * </p>
 *
 * @author Mybatis-plus自动生成
 * @since 2021-10-24
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class RoleMenu implements Cloneable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 角色id
     */
    private Integer roleId;

    /**
     * 路径id
     */
    private Integer menuId;

    @Override
    public Object clone() {
        RoleMenu roleMenu = null;
        try {
            roleMenu = (RoleMenu) super.clone();
        } catch (CloneNotSupportedException e) {
            e.printStackTrace();
        }
        return roleMenu;
    }
}
