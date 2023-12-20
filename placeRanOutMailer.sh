#!/bin/bash

# Получаем значение доступного места на диске
available_space=$(df -h | awk 'NR==7 {print $4}')

# Условие для отправки сообщения, если доступное место меньше 2G
if [[ $available_space < 2G ]]; then
    # Адрес электронной почты отправителя
    sender="test@avemedia.ru"

    # Адрес электронной почты получателя
    recipient="test@test.ru"

    # Тема письма
    subject="Отчет о доступном месте на диске"

    # Тело письма
    body="Доступное место на диске меньше 2G: $available_space"

    # Отправляем письмо с помощью sendmail
    {
    echo "From: $sender"
    echo "To: $recipient"
    echo "Subject: $subject"
    echo ""
    echo "$body"
    } | sendmail -t
fi
