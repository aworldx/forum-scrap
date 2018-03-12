# README

* System dependencies

Requires ChromeDriver

  brew install chromedriver

----------

Задания предназначены для проверки знаний Selenium и Ruby (фреймворк Ruby on Rails) в качестве языка разработки.
Предполагаемый срок исполнения задания -  не более 1 дня.

Можно выполнить 1 из 4 заданий.

Общие указания к заданиям

Необходимо продемонстрировать не только умение решать поставленную задачу, но и умение качественно оформлять код:
  - выбор содержательных названий для классов, методов и переменных
  - разумные комментарии к каждому классу и методу, указание типа и описание для каждого параметра.
  - разумные размеры (по количеству строк) методов и классов
  - использование констант с понятными названиями вместо «магических чисел».
  - Необходимо обдумать не только «позитивный» случай, но и возможные ошибки в процессе обработки (на практике они более чем возможны), в том числе случай, когда меняется структура страниц и алгоритм в принципе перестаёт функционировать корректно. Все такие ошибки должны корректно и, по возможности, унифицированно обрабатываться.

Задание 1. 

Реализуйте автоматизированную проверку наличия новых личных сообщений на Вашем любимом форуме с помощью Selenium на ruby. 
Предполагаемый алгоритм решения задачи:
  - Залогиниться на форум, используя предоставленные логин и пароль аккаунта.
  - Перейти в раздел личных сообщений
  - Попытаться найти элемент, содержащий число новых сообщений
  - В случае его наличия - прочитать innerText / value.

Задачу нужно реализовать на Ruby On Rails в виде API-вызова, где логин и пароль аккаунта являются GET-параметрами, а ответ - JSON-объект с единственным полем "unread_messages_count".
Рекомендуется продумать архитектуру решения: желательно выделить "низкий уровень" элементарных запросов и "высокий уровень" управление навигацией и обработки ошибок навигации, обязательно использовать принцип "тонких контроллеров".

