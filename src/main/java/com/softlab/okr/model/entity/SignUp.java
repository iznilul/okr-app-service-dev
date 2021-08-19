package com.softlab.okr.model.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SignUp {
    private String uid;
    private String name;
    private String gender;
    private String qq;
    private String className;
    private String profile;
    private Byte status;
}
