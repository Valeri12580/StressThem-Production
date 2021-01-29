package com.stressthem.app.web.schedules.impl;

import com.stressthem.app.web.schedules.BackupScheduler;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.mail.Folder;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;

@Component
public class BackupSchedulerImpl implements BackupScheduler {


    @Scheduled(cron = "0 0/1 * 1/1 * ?")
//    @Scheduled(cron = "0 0 0/6 1/1 * ? *")
    @Override
    public void databaseBackup() throws IOException {
        String currentPath=System.getProperty("user.dir")+"/local/db-backup";
        Process process = Runtime.getRuntime().exec("cmd /c dir & docker exec -i my_db mysqldump -uroot -p1234 --databases stress_them_db --skip-comments > backup.sql",null,new File(currentPath));

//        BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
//        String line = "";
//        while ((line = reader.readLine()) != null) {
//            System.out.println(line);
//        }



    }
}
