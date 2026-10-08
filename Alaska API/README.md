# :package:Case #1 - Alaska API

## 📚 Содержание
- [Краткое введение](#title1)
- [Классы эквивалентности и граничные значения](#title2)
- [Чек-лист и Тест-кейсы](https://github.com/Kucharavaya/portfolio/blob/main/API%20Testing%20-%20alaska/test_case.md)
- [Postman](https://github.com/Kucharavaya/portfolio/blob/main/API%20Testing%20-%20alaska/Postman/Postman.md)
- [Баг-репорт](https://github.com/Kucharavaya/portfolio/blob/main/API%20Testing%20-%20alaska/bug_report.md)

***

### <a id="title1"> 1. Краткое введение </a>
***Docker Image*** доступен для скачивания в репозитории: https://hub.docker.com/r/azshoo/alaska.

При запуске контейнера стартует приложение, доступное внутри контейнера по адресу http://localhost:8080.
Документацию для API можно получить внутри контейнера (отправив ***GET*** запрос на эндпоинт ***/info***)

Alaska API — это ***CRUD-сервис*** для управления медведями (*bears*) в Аляске.
Сервис предоставляет набор ***REST-эндпоинтов***, позволяющих создавать, читать, обновлять и удалять записи о медведях. 

Каждый медведь описывается JSON-объектом со следующими полями:

```
json
{
  "bear_id": 1,
  "bear_type": "BLACK",
  "bear_name": "MIKHAIL",
  "bear_age": 17.5
}
```

Допустимые значения `bear_type`: `POLAR`, `BROWN`, `BLACK`, `GUMMY`.

***


### <a id="title2"> 2. Для поля `bear_age` были определены классы эквивалентности и граничные значения</a> 
| Позитивные классы      | Граничные значения                       | 
|-|-|					
| 0 - 100                | -0.01, 0, 0.01, 99.99, 100, 100.01 |					
| **Негативные классы**      |                      |
|-|-|					
| от - :infinity:  до -0.01| для - :infinity: нет, -0.01               |
| 17.000000005           | 17.000000005                             |
| от 100.01 до + :infinity: | 100.01, для + :infinity: нет             |
| строковое значение     | нельзя определить                        |
| спецсимволы	         | нельзя определить                        |

***
