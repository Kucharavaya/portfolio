# API-тестирование - Alaska API (Баг-репорт) 
> 💡 Баг-репорты к `POST/bear`

***BUG-01 (в JIRA)*** к ТС №4: Создать медведя c `[bear_type:GUMMY]`
 
<img width="1186" height="813" alt="Screenshot_1" src="https://github.com/user-attachments/assets/d61fc418-322e-4380-b3e7-ac71ec51d853" />

---

***BUG-02*** к ТС №5: Создать медведя с пустым значением поля `[bear_type]`
| Параметр | Описание |
| :--- | :--- |
| **ID** | BUG-02 |
| **Заголовок** | Необработанное исключение при передаче пустого значения в поле `bear_type` |
| **Severity** | Major |
| **Priority** | High |
| **Окружение** | • Развертывание: Docker<br>• Инструмент: Postman (v.12.19.4) |
| **Предусловия** | Контейнер запущен и доступен. В базе данных нет записей. |
| **Шаги воспроизведения** | 1. Отправить `POST` запрос на на http://localhost:8080/bear с телом в формате `JSON`: `{"bear_type":"", "bear_name":"MIKHAIL", "bear_age":17.5}`.<br>2. Проверить код ответа и тело.<br> |
| **Фактический результат** | • **HTTP-ответ:** `500 Server Error`.<br>• **Тело ответа:** `<html><body><h2>500 Internal Server Error</h2></body></html>`.<br> |
| **Ожидаемый результат** | • **HTTP-ответ:** `400 Bad Request`.<br>• **Тело ответа:** Понятное сообщение об ошибке валидации (например, `<html><body><h2>400 Bad Request (There are no values in the field [bear_type])</h2></body></html>`). |
| **Приложения** | Скриншот лога из Docker. <img width="1113" height="595" alt="log_bag2" src="https://github.com/user-attachments/assets/97bbe963-c30e-4526-b17d-678171457872" /> |

---
