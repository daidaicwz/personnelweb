package com.hg.service;

import com.hg.pojo.Counts;
import org.springframework.stereotype.Service;

public interface CountsService {
    Counts selectCounts();
}
