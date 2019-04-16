Feature: Login

    System Login

    Scenario: Empty payload
        Given The admin user exist on database
        When The user Login
            """
            {}
            """
        Then The message should be showed
            """
            {
                "username": ["missing data"],
                "password": ["missing data"]
            }
            """

    Scenario: Payload without password
        Given The admin user exist on database
        When The user Login
            """
            {
                "username": "admin"
            }
            """
        Then The message should be showed
            """
            {
                "password": ["missing data"]
            }
            """

    Scenario: Payload without username
        Given The admin user exist on database
        When The user Login
            """
            {
                "password": "123"
            }
            """
        Then The message should be showed
            """
            {
                "username": ["missing data"]
            }
            """

    Scenario: Login successfuly
        Given The admin user exist on database
        When The user Login
            """
            {   
                "username": "admin",
                "password": "123"
            }
            """
        Then The message should be showed
            """
            {
                "message": "success"
            }
            """
    