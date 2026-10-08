# :envelope: Postman
## 📚 Содержание
- [Часть 1: Описание](#title1)
- [Часть 2: Инструкция по запуску](#title2)
  
### 📦 <a id="title1">Часть 1: Описание</a>

Ниже представлена полная иерархическая структура коллекции с указанием методов, названий запросов и используемых Data Files.

#### 🌳 Структура коллекции

```
📦 Alaska API
│
├── 📂 GET /info: 200 - Документация
│   └── 📄 GET /info: 200 – Документация отображается
│
├── 📂 POST /bear
│   │
│   ├── 📂 POST /bear: 200 - Успешные сценарии
│   │   ├── 📄 TC [1-4] – Создать медведя с валидным [bear_type]
│   │   │      └── 🔗 Data File: post_200_TC[1-4]_type.json (4 итерации)
│   │   ├── 📄 TC [16-19, 25-26] – Создать медведя с валидным [bear_name]
│   │   │      └── 🔗 Data File: post_200_TC[16-19, 25-26]_name.json (6 итераций)
│   │   ├── 📄 TC [27, 30-32, 34] – Создать медведя с валидным [bear_age]
│   │   │      └── 🔗 Data File: post_200_TC[27, 30-32, 34]_age.json (5 итераций)
│   │   └── 📄 TC [44] – Повторная отправка идентичных данных
│   │
│   ├── 📂 POST /bear: 400 - Негативные сценарии
│   │   ├── 📄 TC [5] – Пустое значение поля [bear_type]
│   │   ├── 📄 TC [6] – Отсутствует поле [bear_type]
│   │   ├── 📄 TC [7-13] – Создать медведя с невалидным [bear_type]
│   │   │      └── 🔗 Data File: post_400_TC[7-13]_type.json (7 итераций)
│   │   ├── 📄 TC [14] – Отсутствует поле [bear_name]
│   │   ├── 📄 TC [15] – Пустое значение поля [bear_name]
│   │   ├── 📄 TC [20-24] – Создать медведя с невалидным [bear_name]
│   │   │      └── 🔗 Data File: post_400_TC[20-24]_name.json (5 итераций)
│   │   ├── 📄 TC [28] – Отсутствует поле [bear_age]
│   │   ├── 📄 TC [29] – Пустое значение поля [bear_age]
│   │   ├── 📄 TC [33, 35-43] – Создать медведя с невалидным [bear_age]
│   │   │      └── 🔗 Data File: post_400_TC[33, 35-43]_age.json (5 итераций)
│   │   ├── 📄 TC [45] – Отсутствуют значений во всех полях
│   │   └── 📄 TC [46] – Отсутствуют все поля (пустой JSON)
│   │
│   └── 📄 Удаление данных после POST!!!
│
├── 📂 GET /bear
│   ├── 📄 TC [1] - В базе данных нет записей
│   └── 📄 TC [2] - Получить все имеющиеся записи
│          └── 📜 Pre-request Script: создаёт 3 эталонных медведя (ID 31-33)
│
├── 📂 GET /bear/:id
│   ├── 📄 TC [3] - Получение существующего медведя [id = 31]
│   └── 📄 TC [4] - Получении несуществующего медведя
│
├── 📂 PUT /bear/:id
│   │
│   ├── 📂 PUT /bear/:id 200 - Успешные сценарии
│   │   ├── 📄 TC [1] - Изменение всех полей
│   │   ├── 📄 TC [2] - Изменить значение поля [bear_type = BROWN]
│   │   ├── 📄 TC [4] - Изменить значение поля [bear_name = MIK]
│   │   └── 📄 TC [6] - Изменить значение поля [bear_age]
│   │
│   └── 📂 PUT /bear/:id 400 - Негативные сценарии
│       ├── 📄 TC [3] - Изменить значение поля [bear_type = PANDA]
│       ├── 📄 TC [5] - Изменить значение поля [bear_name = число]
│       ├── 📄 TC [7] - Изменить значение поля [bear_age = текст]
│       └── 📄 TC [8] - Обновить несуществующего медведя
│
├── 📂 DELETE /bear/:id
│   ├── 📄 TC [2] - Удаление медведя [id = 31]
│   ├── 📄 TC [3] - Повторное удаление медведя [id = 31]
│   └── 📄 TC [4] - Удаление несуществующего медведя [id = 555]
│
└── 📂 DELETE /bear
    ├── 📄 TC [5] - Удаление всех медведей
    └── 📄 TC [1] - Удаление, в БД пусто

```
🗂️ Data Files можно взять в файле [POST_data](https://github.com/Kucharavaya/portfolio/tree/main/Alaska%20API/Postman/POST_data)

#### Как это было выполнено
Коллекция реализована с использованием следующих возможностей Postman:

- ***Pre-request Scripts*** — для подготовки тестовых данных (создание эталонных медведей через `POST /bear`).

- ***Tests Scripts*** — для проверки статус-кодов, тела ответа, структуры JSON и состояния БД.

- `pm.sendRequest()` — для выполнения дополнительных асинхронных запросов (например, `GET /bear/:id` после `POST`).

- ***Параметризация через Data Files (JSON)*** — для прогона множества однотипных тестов (например, невалидные `bear_type`) с разными входными данными в одном запросе.

- ***Постусловия (Post-condition)*** — для отката изменений в БД после деструктивных тестов (`PUT`).

- ***Рекурсивные функции*** — для последовательного создания/удаления записей с гарантированным порядком ID.

- ***Переменные окружения (Environment Variables)*** — для хранения `baseUrl` и динамических значений (`bear_id`, `bear1_data`, `bear2_data`).

### 📖 <a id="title2">Часть 2: Инструкция по запуску</a>
#### 1. Сохранение файла:
- Сохрани файл под именем [`Alaska API.postman_collection.json`](https://github.com/Kucharavaya/portfolio/blob/main/Alaska%20API/Postman/Alaska%20API.postman_collection.json).

#### 2. Импорт в Postman:
- Перетащи файл `Alaska API.postman_collection.json` в окно импорта ***Postman*** или выбери его через файловый менеджер.
#### 3. Настройка переменных окружение (Environment Variables)
- Перед запуском коллекции необходимо создать ***Environment*** (например, `Alaska ENV`) и задать следующие переменные:

| Переменная | Значение | Назначение |
|--|--|--|
|`baseUrl`|	http://localhost:8080	|Базовый URL API|
|`bear_id`|		|ID текущего тестируемого медведя (используется в `GET/PUT/DELETE /bear/:id`)|
|`bear1_data`|		|Сохраняется автоматически в тесте ***TC [44]*** — данные первого медведя для сравнения|
|`bear2_data`|		|Сохраняется автоматически в тесте ***TC [44]*** — данные второго (дублированного) медведя|

>💡 Значение `bear_id` устанавливается автоматически в тестах `POST /bear` (при создании медведя ID сохраняется в переменную окружения) или вручную — в зависимости от сценария.

#### 4. Последовательность выполнения тестов
Для корректного прохождения всех тестов запускай коллекцию в следующем порядке (через ***Collection Runner***):

##### 📌 Этап 1: POST-тесты (создание данных)
<table>
  <thead>
    <tr>
      <th width="50" align="center">№</th>
      <th width="630" align="center">Запрос</th>
      <th width="300" align="center">Data File</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td align="center">1</td>
      <td>GET /info: 200 – Документация отображается</td>
      <td align="center">-</td>
    </tr>
    <tr>
      <td align="center">2</td>
      <td>POST TC [1-4] – Создать медведя с валидным [bear_type]</td>
      <td align="center">post_200_TC[1-4]_type.json</td>
    </tr>
    <tr>
      <td align="center">3</td>
      <td>POST TC [16-19, 25-26] – Создать медведя с валидным [bear_name]</td>
      <td align="center">post_200_TC[16-19, 25-26]_name.json</td>
    </tr>
    <tr>
      <td align="center">4</td>
      <td>POST TC [27, 30-32, 34] – Создать медведя с валидным [bear_age]</td>
      <td align="center">post_200_TC[27, 30-32, 34]_age.json</td>
    </tr>
    <tr>
      <td align="center">5</td>
      <td>POST TC [44] – Повторная отправка идентичных данных</td>
      <td align="center">—</td>
    </tr>
    <tr>
      <td align="center">6</td>
      <td>POST TC [5] – Пустое значение поля [bear_type]</td>
      <td align="center">—</td>
    </tr>
    <tr>
      <td align="center">7</td>
      <td>POST TC [6] – Отсутствует поле [bear_type]</td>
      <td align="center">—</td>
    </tr>
    <tr>
      <td align="center">8</td>
      <td>POST TC [7-13] – Создать медведя с невалидным [bear_type]</td>
      <td align="center">post_400_TC[7-13]_type.json</td>
    </tr>
    <tr>
      <td align="center">9</td>
      <td>POST TC [14] – Отсутствует поле [bear_name]</td>
      <td align="center">—</td>
    </tr>
    <tr>
      <td align="center">10</td>
      <td>POST TC [15] – Пустое значение поля [bear_name]</td>
      <td align="center">—</td>
    </tr>
    <tr>
      <td align="center">11</td>
      <td>POST TC [20-24] – Создать медведя с невалидным [bear_name]</td>
      <td align="center">post_400_TC[20-24]_name.json</td>
    </tr>
    <tr>
      <td align="center">12</td>
      <td>POST TC [28] – Отсутствует поле [bear_age]</td>
      <td align="center">—</td>
    </tr>
    <tr>
      <td align="center">13</td>
      <td>POST TC [29] – Пустое значение поля [bear_age]</td>
      <td align="center">—</td>
    </tr>
    <tr>
      <td align="center">14</td>
      <td>POST TC [33, 35-43] – Создать медведя с невалидным [bear_age]</td>
      <td align="center">post_400_TC[33, 35-43]_age.json</td>
    </tr>
    <tr>
      <td align="center">15</td>
      <td>POST TC [45] – Отсутствуют значения во всех полях</td>
      <td align="center">—</td>
    </tr>
    <tr>
      <td align="center">16</td>
      <td>POST TC [46] – Отсутствуют все поля (пустой JSON)</td>
      <td align="center">—</td>
    </tr>
    <tr>
      <td align="center">17</td>
      <td>DELETE – Удаление данных после POST!!!</td>
      <td align="center">—</td>
    </tr>
  </tbody>
</table>

>⚠️ В коллекции есть отдельный запрос `Удаление данных после POST!!!`, который удаляет все записи, созданные в ходе POST-тестов. Это позволяет запускать тесты в изолированном окружении.

##### 📌 Этап 2: GET-тесты (чтение данных)
<table>
  <thead>
    <tr>
      <th width="50" align="center">№</th>
      <th width="630" align="center">Запрос</th>
      <th width="300" align="center">Data File</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td align="center">1</td>
      <td>GET TC [1] – В базе данных нет записей</td>
      <td align="center">-</td>
    </tr>
    <tr>
      <td align="center">2</td>
      <td>GET TC [2] – Получить все имеющиеся записи (создаёт 3 медведя через Pre-request)</td>
      <td align="center">-</td>
    </tr>
    <tr>
      <td align="center">3</td>
      <td>GET TC [3] – Получение существующего медведя [id = 31]</td>
      <td align="center">-</td>
    </tr>
    <tr>
      <td align="center">4</td>
      <td>GET TC [4] – Получение несуществующего медведя</td>
      <td align="center">-</td>
    </tr>
  </tbody>
</table>

>⚠️ После этапа 2 в БД остаются 3 медведя с ID `31, 32, 33`.

##### 📌 Этап 3: PUT-тесты (обновление данных)
<table>
  <thead>
   <tr>
      <th width="50" align="center">№</th>
      <th width="630" align="center">Запрос</th>
      <th width="300" align="center">Data File</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td align="center">1</td>
      <td>PUT TC [1] – Изменение всех полей</td>
      <td align="center">-</td>
    </tr>
    <tr>
      <td align="center">2</td>
      <td>PUT TC [2] – Изменить значение поля [bear_type = BROWN]</td>
      <td align="center">-</td>
    </tr>
    <tr>
      <td align="center">3</td>
      <td>PUT TC [4] – Изменить значение поля [bear_name = MIK]</td>
      <td align="center">-</td>
    </tr>
    <tr>
      <td align="center">4</td>
      <td>PUT TC [6] – Изменить значение поля [bear_age]</td>
      <td align="center">-</td>
    </tr>
    <tr>
      <td align="center">5</td>
      <td>PUT TC [3] – Изменить значение поля [bear_type = PANDA] (400)</td>
      <td align="center">-</td>
    </tr>
    <tr>
      <td align="center">6</td>
      <td>PUT TC [5] – Изменить значение поля [bear_name = число] (400)</td>
      <td align="center">-</td>
    </tr>
    <tr>
      <td align="center">7</td>
      <td>PUT TC [7] – Изменить значение поля [bear_age = текст] (400)</td>
      <td align="center">-</td>
    </tr>
    <tr>
      <td align="center">8</td>
      <td>PUT TC [8] – Обновить несуществующего медведя (404)</td>
      <td align="center">-</td>
    </tr>
  </tbody>
</table>

>⚠️ После каждого PUT-теста выполняется Post-condition откат к BLACK / MIKHAIL / 17.5.

##### 📌 Этап 4: DELETE-тесты (удаление данных)
<table>
  <thead>
    <tr>
      <th width="50" align="center">№</th>
      <th width="630" align="center">Запрос</th>
      <th width="300" align="center">Data File</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td align="center">1</td>
      <td>DELETE TC [2] – Удаление медведя [id = 31]</td>
      <td align="center">-</td>
    </tr>
    <tr>
      <td align="center">2</td>
      <td>DELETE TC [3] – Повторное удаление медведя [id = 31] (404)</td>
      <td align="center">-</td>
    </tr>
    <tr>
      <td align="center">3</td>
      <td>DELETE TC [4] – Удаление несуществующего медведя [id = 555] (404)</td>
      <td align="center">-</td>
    </tr>
    <tr>
      <td align="center">4</td>
      <td>DELETE TC [5] – Удаление всех медведей</td>
      <td align="center">-</td>
    </tr>
    <tr>
      <td align="center">5</td>
      <td>DELETE TC [1] – Удаление, в БД пусто</td>
      <td align="center">-</td>
    </tr>
  </tbody>
</table>

##### 📌 Финальное состояние
По завершении всех тестов база данных должна быть пуста (`GET /bear` возвращает `[]`).
