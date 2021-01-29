package com.stressthem.app.web.schedules;

import java.io.IOException;

public interface BackupScheduler {

    void databaseBackup() throws IOException;
}
