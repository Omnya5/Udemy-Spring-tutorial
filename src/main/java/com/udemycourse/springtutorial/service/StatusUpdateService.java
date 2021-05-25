package com.udemycourse.springtutorial.service;

import com.udemycourse.springtutorial.model.StatusUpdate;
import com.udemycourse.springtutorial.model.StatusUpdateDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

@Service
public class StatusUpdateService {

    private final static int PAGESIZE = 10;

    @Autowired
    private StatusUpdateDao statusUpdateDao;

    public void save(StatusUpdate statusUpdate) {
        statusUpdateDao.save(statusUpdate);
    }

    public StatusUpdate getLatest() {
        return statusUpdateDao.findFirstByOrderByAddedDesc();
    }

    public Page<StatusUpdate> getPage(int pageNumber) {
        PageRequest request = PageRequest.of(pageNumber-1, PAGESIZE, Sort.by("added").descending());
        return statusUpdateDao.findAll(request);
    }

    public void delete(Long id) {
        statusUpdateDao.deleteById(id);
    }

    public StatusUpdate get(Long id) {
        return statusUpdateDao.getOne(id);
    }
}
