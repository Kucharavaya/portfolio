# API-тестирование - Alaska API (Postman-коллекция)

## Цель

Проверить корректность работы REST API Alaska API: CRUD-операции, валидацию полей, обработку ошибок (400/404), состояние базы данных после запросов, а также автоматизацию проверок с помощью Postman.

## Проверенные сценарии

- `GET /info` — документация API
- `POST /bear`:
  - успешные сценарии (200): валидные `bear_type`, `bear_name`, `bear_age`, повторная отправка идентичных данных
  - негативные сценарии (400): пустые/отсутствующие поля, невалидные значения, пустой JSON
- `GET /bear` — получение всех записей (пустая и заполненная БД)
- `GET /bear/:id` — существующий и несуществующий медведь
- `PUT /bear/:id`:
  - успешные (200): изменение всех полей, отдельных полей
  - негативные (400/404): невалидные значения, обновление несуществующего
- `DELETE /bear/:id` — удаление существующего, повторное, несуществующего
- `DELETE /bear` — удаление всех, при пустой БД
- Проверка состояния БД после деструктивных тестов (Post-condition)
- Параметризация через Data Files (JSON) для однотипных тестов
- Использование Pre-request Scripts для подготовки данных
- Использование Tests Scripts для проверки статус-кодов, тела ответа, структуры JSON
- Использование `pm.sendRequest()` для асинхронных запросов
- Использование переменных окружения (`baseUrl`, `bear_id`, `bear1_data`, `bear2_data`)

## Как открыть коллекцию

1. Сохранить файл [Alaska API.postman_collection.json](https://github.com/Kucharavaya/portfolio/blob/main/Alaska%20API/Postman/Alaska%20API.postman_collection.json).
2. Импортировать файл в Postman (перетащить или через файловый менеджер).
3. Создать Environment (например, `Alaska ENV`) и задать переменные:
   - `baseUrl` = `http://localhost:8080` 
   - `bear_id` — заполняется автоматически или вручную
   - `bear1_data`, `bear2_data` — заполняются автоматически в TC [44]
4. Запускать коллекцию через **Collection Runner** в следующей последовательности:
   - **Этап 1: POST-тесты** (создание данных) — 17 запросов, включая удаление данных после POST.
   - **Этап 2: GET-тесты** (чтение данных) — 4 запроса.
   - **Этап 3: PUT-тесты** (обновление данных) — 8 запросов.
   - **Этап 4: DELETE-тесты** (удаление данных) — 5 запросов.
5. По завершении всех тестов база данных должна быть пуста (`GET /bear` возвращает `[]`).

> 💡 Подробная структура коллекции и таблицы с последовательностью запросов приведены в [описании коллекции](https://github.com/Kucharavaya/portfolio/blob/main/Alaska%20API/Postman/collection_description.md).

## Артефакты

- [Postman-коллекция](https://github.com/Kucharavaya/portfolio/blob/main/Alaska%20API/Postman/Alaska%20API.postman_collection.json)
- [Data Files (POST_data)](https://github.com/Kucharavaya/portfolio/tree/main/Alaska%20API/Postman/POST_data)
- [Чек-лист и тест-кейсы](https://github.com/Kucharavaya/portfolio/blob/main/Alaska%20API/test_case.md)
- [Баг-репорт](https://github.com/Kucharavaya/portfolio/blob/main/Alaska%20API/bug_report.md)
