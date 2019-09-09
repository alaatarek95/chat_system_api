# README

To run the application : docker-compose up

the application will run on localhost:3001

---------------------------------
this is a chat system based on rails as a backend engine, mysql as database engin , elasticsearch

it depends on workers to save the data in a queuing system
---------------------------------

APIs:
Application:
    create an application: 
        POST /api/v1/application
        {
            "application" : {
                "name": "APPLICATION-NAME"
            }
        }
    get an applictaion:
        GET /api/v1/application?application_token=APPLICATION-TOKEN

    update an application:
        PATCH /api/v1/application?applictaion_token=APPLICATION-TOKEN

Chat:
    create a chat: 
        POST /api/v1/chat
        {
            "chat" : {
                "application_token": "APPLICATION-TOKEN"
            }
        }
    get a chat:
        GET /api/v1/chat?application_token=APPLICATION-TOKEN&chat_number=0

    update a chat:
        PATCH /api/v1/chat?applictaion_token=APPLICATION-TOKEN&chat_number=0

Message:
    create a message: 
        POST /api/v1/message
        {
            "message" : {
                "application_token": "APPLICATION-TOKEN",
                "chat_number": 0,
                "body": "MESSAGE-BODY"
            }
        }
    get a message:
        GET /api/v1/message?application_token=APPLICATION-TOKEN&chat_number=0&message_number=0

    update a message:
        PATCH /api/v1/message?applictaion_token=APPLICATION-TOKEN&chat_number=0&message_number=0
    search:
        GET /api/v1/message/search?q=MESSAGE-BODY

This application was developed by @alaatarek95 and I am looking forward for your feedbacks and suggestions

Alaa Tarek



