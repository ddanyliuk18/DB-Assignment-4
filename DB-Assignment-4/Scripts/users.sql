USE assignment4;

        CREATE USER 'news_agent'@'assignment_4' IDENTIFIED BY 'superqwerty123';
        GRANT SELECT ON assignment4.results TO 'news_agent'@'assignment_4';

        
        CREATE USER 'admin'@'assignment_4' IDENTIFIED BY 'analysisentry';
        GRANT SELECT ON assignment4.* TO 'admin'@'assignment_4';

        
        CREATE USER 'lawyer'@'assignment_4' IDENTIFIED BY 'qwerty123';
        GRANT SELECT ON assignment4.athlete_passports TO 'lawyer'@'assignment_4';
        
FLUSH PRIVILEGES;