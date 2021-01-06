package com.stressthem.app.services;

import com.stressthem.app.repositories.MethodRepository;
import com.stressthem.app.services.interfaces.MethodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MethodServiceImpl implements MethodService {
    private MethodRepository methodRepository;

    @Autowired
    public MethodServiceImpl(MethodRepository methodRepository) {
        this.methodRepository = methodRepository;
    }


}
