# Описание (Postman-коллекция)

#### Структура коллекции

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
│   │   │      └── 🔗 Data File: post_400_TC[33, 35-43]_age.json (10 итераций)
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
#### Последовательность выполнения тестов
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
