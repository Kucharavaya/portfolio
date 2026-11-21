# API-тестирование - Alaska API (Баг-репорт)

## Баг-репорты к `POST/bear`
### <a id="title2">Баг-репорт №1</a> к Тест-кейсу №4: Создать медведя c `[bear_type:GUMMY]`
| Параметр | Описание |
| :--- | :--- |
| **ID** | BUG-01 |
| **Заголовок** | POST/bear: сервер не распознает тип GUMMY и сохраняет дефолтные значения (UNKNOWN / EMPTY_NAME / 0.0) вместо переданных|
| **Severity** | Critical |
| **Priority** | High |
| **Воспроизводимость** | Всегда |
| **Окружение** | • Развертывание: Docker<br>• Инструмент: Postman (v.12.19.4) |
| **Предусловия** | Контейнер запущен и доступен. В базе данных нет записей. |
| **Шаги воспроизведения** | 1. Отправить `POST` запрос на http://localhost:8080/bear с заголовком `Content-Type: application/json` и телом в формате `JSON`: `{"bear_type":"GUMMY", "bear_name":"MIKHAIL", "bear_age":17.5}`.<br>2. Получить ответ сервера (статус 200 ОК, тело: 1).<br>3. Отправить `GET` запрос на http://localhost:8080/bear <br>4. Ставанить тело ответа с отправленным. |
| **Фактический результат** |1. `POST/bear`: **HTTP-статус** `200 ОК` **Тело ответа** `1`. <br>2. `GET/bear`: **HTTP-статус** `200 ОК` **Тело ответа** `[{"bear_id":1,"bear_type":"UNKNOWN","bear_name":"EMPTY_NAME","bear_age":0.0}]`. |
| **Ожидаемый результат** |1. `POST/bear`: **HTTP-статус** `200 ОК` **Тело ответа** `1`. <br>2. `GET/bear`: **HTTP-статус** `200 ОК` **Тело ответа** `[{"bear_id":1,"bear_type":"GUMMY","bear_name":"MIKHAIL","bear_age":17.5}]`. |
| **Доп.информация** |  Связанный дефект: **BUG-04** [(см. ниже)]((#title1)).|
| **Приложения** | Скриншот лога из Docker: <img width="995" height="146" alt="image" src="https://github.com/user-attachments/assets/5ce10340-b361-4a93-8008-d16cead3c742" /><br>Лог Postman:<br>`POST http://localhost:8080/bear`<br>`HTTP/1.1 200 OK`<br>`Content-Type: text/html;charset=utf-8`<br>`Transfer-Encoding: chunked`<br>`Server: Jetty(9.4.z-SNAPSHOT)`<br><br>`1`<br><br>`GET http://localhost:8080/bear`<br>`HTTP/1.1 200 OK`<br>`Content-Type: text/html;charset=utf-8`<br>`Transfer-Encoding: chunked`<br>`Server: Jetty(9.4.z-SNAPSHOT)`<br><br>`[{"bear_id":1,"bear_type":"UNKNOWN","bear_name":"EMPTY_NAME","bear_age":0.0}]`<br> |

> **_BUG-01 (в JIRA)_**
> <img width="1186" height="813" alt="gummy" src="https://github.com/user-attachments/assets/58150393-4ee1-476e-846b-6aa1fdbd807e" />

---

### Баг-репорт №2 к Тест-кейсу №5: Создать медведя с пустым значением поля `[bear_type]`
| Параметр | Описание |
| :--- | :--- |
| **ID** | BUG-02 |
| **Заголовок** | Необработанное исключение при передаче пустого значения в поле `bear_type`, в логах Docker ошибка <Error…> |
| **Severity** | Major |
| **Priority** | High |
| **Воспроизводимость** | Всегда |
| **Окружение** | • Развертывание: Docker<br>• Инструмент: Postman (v.12.19.4) |
| **Предусловия** | Контейнер запущен и доступен. В базе данных нет записей. |
| **Шаги воспроизведения** | 1. Отправить `POST` запрос на на http://localhost:8080/bear с заголовком `Content-Type: application/json` и телом в формате `JSON`: `{"bear_type":"", "bear_name":"MIKHAIL", "bear_age":17.5}`.<br>2. Проверить код ответа и тело.<br> |
| **Фактический результат** | • **HTTP-статус:** `500 Server Error`.<br>• **Тело ответа:** `<html><body><h2>500 Internal Server Error</h2></body></html>`.<br>• **В логах Docker** ошибка <Error…> (приложен кусок лога с ошибкой). |
| **Ожидаемый результат** | • **HTTP-статус:** `400 Bad Request`.<br>• **Тело ответа:** Понятное сообщение об ошибке валидации (например, `<html><body><h2>400 Bad Request (There are no values in the field [bear_type])</h2></body></html>`). |
| **Доп.информация** | |
| **Приложения** | Скриншот лога из Docker. <img width="1113" height="595" alt="log_bag2" src="https://github.com/user-attachments/assets/97bbe963-c30e-4526-b17d-678171457872" /> |

---

## Баг-репорты к `GET/bear`
### Баг-репорт №3  к Тест-кейсу №4: Проверить ошибку (404) при получении несуществующего медведя  ( GET /bear/:id, получение медведя по [id = 555]).
| Параметр | Описание |
| :--- | :--- |
| **ID** | BUG-03 |
| **Заголовок** | `GET /bear/{id}` для несуществующего `id` возвращает `200 OK` с телом `EMPTY` вместо `404 Not Found` |
| **Severity** | Major |
| **Priority** | Medium |
| **Воспроизводимость** | Всегда |
| **Окружение** | • Развертывание: Docker<br>• Инструмент: Postman (v.12.19.4) |
| **Предусловия** | Контейнер запущен и доступен. В базе данных **отсутствует** объект с [bear_id:555]. |
| **Шаги воспроизведения** | 1. Отправить `GET` запрос на http://localhost:8080/bear/555.<br>2. Проверить код ответа и тело.|
| **Фактический результат** | •**HTTP-статус:** `200 OK`.<br>• **Тело ответа:** `EMPTY`. |
| **Ожидаемый результат** | • **HTTP-статус:** `404 Not Found`.<br> **Тело ответа:** Содержит сообщение об отсутствии медведя с [bear_id:555]. |
| **Доп.информация** |  |
| **Приложения** | Лог Docker:<br>`[INFO] 2026-11-21 17:38:49.045 BearRead - Bear read route call:`<br>`body - '""'`<br>`head - '{":id":"555"}'`<br><br>Лог Postman:<br>`GET http://localhost:8080/bear/555`<br>`HTTP/1.1 200 OK`<br>`Content-Type: text/html;charset=utf-8`<br>`Transfer-Encoding: chunked`<br>`Server: Jetty(9.4.z-SNAPSHOT)`<br><br>`EMPTY` |

---

### <a id="title1">Баг-репорт №4</a>
| Параметр | Описание |
| :--- | :--- |
| **ID** | BUG-04 |
| **Заголовок** | `GET /bear/{id}` возвращает `null (200 OK)` для существующего медведя с [bear_type:GUMMY] |
| **Severity** | Critical |
| **Priority** | High |
| **Воспроизводимость** | Всегда |
| **Окружение** | • Развертывание: Docker<br>• Инструмент: Postman (v.12.19.4) |
| **Предусловия** | Контейнер запущен и доступен. В хранилище присутствует объект с `bear_id=1` (создан через `POST /bear` с телом `{"bear_type":"GUMMY", "bear_name":"MIKHAIL", "bear_age":17.5}`). |
| **Шаги воспроизведения** | 1. Отправить `GET` запрос на http://localhost:8080/bear и убедиться, что в ответе есть объект с `bear_id=1`.<br>2. Отправить `GET` запрос на http://localhost:8080/bear/1.<br>3.Проверить код ответа и тело. |
| **Фактический результат** |1. `GET/bear`: **HTTP-статус:** `200 OK` **Тело ответа:** `[{"bear_id":1,"bear_type":"UNKNOWN","bear_name":"EMPTY_NAME","bear_age":0.0}]`.<br>2. `GET/bear/1`: **HTTP-статус:** `200 OK` **Тело ответа:** `null`. |
| **Ожидаемый результат** | `GET/bear/1`: **HTTP-статус:** `200 OK` **Тело ответа:** `{"bear_type":"GUMMY", "bear_name":"MIKHAIL", "bear_age":17.5}`. |
| **Доп.информация** | Связанный дефект: **BUG-01** [(см. выше)](#title2). |
| **Приложения** |  Скриншот лога из Docker: <img width="932" height="252" alt="image" src="https://github.com/user-attachments/assets/dab4b15e-caf5-4612-a479-b30d0231d68e" /><br>Лог Postman:<br>`GET http://localhost:8080/bear`<br>`HTTP/1.1 200 OK`<br>`Content-Type: text/html;charset=utf-8`<br>`Transfer-Encoding: chunked`<br>`Server: Jetty(9.4.z-SNAPSHOT)`<br><br>`[{"bear_id":1,"bear_type":"UNKNOWN","bear_name":"EMPTY_NAME","bear_age":0.0}]`<br><br>`GET http://localhost:8080/bear/1`<br>`HTTP/1.1 200 OK`<br>`Content-Type: text/html;charset=utf-8`<br>`Transfer-Encoding: chunked`<br>`Server: Jetty(9.4.z-SNAPSHOT)`<br><br>`null`<br> |

---

