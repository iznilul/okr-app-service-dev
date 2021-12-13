package com.softlab.okr.service;

import java.util.List;

public interface IEnumService {

    List<String> getLikeUsername(String username);

    List<String> getLikeName(String name);

    List<String> getLikeMajor(String major);

    List<String> getLikeTag();
}
