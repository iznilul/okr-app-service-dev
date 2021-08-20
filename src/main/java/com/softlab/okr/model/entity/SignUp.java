package com.softlab.okr.model.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SignUp extends BaseEntity {

  private String id;
  private String name;
  private String gender;
  private String qq;
  private String major;
  private String profile;
  private Byte status;
  private String comment;
}
