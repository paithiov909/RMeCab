# RMeCabC works

    {
      "type": "character",
      "attributes": {
        "names": {
          "type": "character",
          "attributes": {},
          "value": ["名詞", "記号", "名詞", "助詞", "名詞", "助詞", "名詞", "助詞", "動詞", "助動詞", "記号"]
        }
      },
      "value": ["今日", "、", "私", "は", "数学", "の", "本", "を", "読ん", "だ", "。"]
    }

# docMatrixDF works

    {
      "type": "integer",
      "attributes": {
        "dim": {
          "type": "integer",
          "attributes": {},
          "value": [4, 1]
        },
        "dimnames": {
          "type": "list",
          "attributes": {},
          "value": [
            {
              "type": "character",
              "attributes": {},
              "value": ["今日", "数学", "本", "私"]
            },
            {
              "type": "character",
              "attributes": {},
              "value": ["ROW.1"]
            }
          ]
        }
      },
      "value": [1, 1, 1, 1]
    }

# docDF works for a data frame

    {
      "type": "list",
      "attributes": {
        "class": {
          "type": "character",
          "attributes": {},
          "value": ["data.frame"]
        },
        "names": {
          "type": "character",
          "attributes": {},
          "value": ["TERM", "POS1", "POS2", "Row1", "Row2", "Row3"]
        },
        "row.names": {
          "type": "character",
          "attributes": {},
          "value": ["1", "2", "3", "4", "5", "6", "7", "8"]
        }
      },
      "value": [
        {
          "type": "character",
          "attributes": {},
          "value": ["、", "。", "の", "は", "を", "数学", "本", "読む"]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["記号", "記号", "助詞", "助詞", "助詞", "名詞", "名詞", "動詞"]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["読点", "句点", "連体化", "係助詞", "格助詞", "一般", "一般", "自立"]
        },
        {
          "type": "integer",
          "attributes": {},
          "value": [1, 1, 1, 1, 1, 1, 1, 1]
        },
        {
          "type": "integer",
          "attributes": {},
          "value": [0, 1, 1, 1, 1, 0, 1, 1]
        },
        {
          "type": "integer",
          "attributes": {},
          "value": [1, 1, 1, 1, 1, 1, 1, 1]
        }
      ]
    }

---

    {
      "type": "list",
      "attributes": {
        "class": {
          "type": "character",
          "attributes": {},
          "value": ["data.frame"]
        },
        "names": {
          "type": "character",
          "attributes": {},
          "value": ["N1", "N2", "POS1", "POS2", "Row1", "Row2", "Row3"]
        },
        "row.names": {
          "type": "character",
          "attributes": {},
          "value": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22"]
        }
      },
      "value": [
        {
          "type": "character",
          "attributes": {},
          "value": ["、", "、", "だ", "です", "の", "は", "は", "は", "ます", "また", "を", "予定", "今日", "数学", "明後日", "明日", "本", "私", "英語", "読む", "読む", "読む"]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["また", "私", "。", "。", "本", "、", "数学", "英語", "。", "数学", "読む", "です", "、", "の", "は", "は", "を", "は", "の", "だ", "ます", "予定"]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["記号-接続詞", "記号-名詞", "助動詞-記号", "助動詞-記号", "助詞-名詞", "助詞-記号", "助詞-名詞", "助詞-名詞", "助動詞-記号", "接続詞-名詞", "助詞-動詞", "名詞-助動詞", "名詞-記号", "名詞-助詞", "名詞-助詞", "名詞-助詞", "名詞-助詞", "名詞-助詞", "名詞-助詞", "動詞-助動詞", "動詞-助動詞", "動詞-名詞"]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["読点-*", "読点-代名詞", "*-句点", "*-句点", "連体化-一般", "係助詞-読点", "係助詞-一般", "係助詞-一般", "*-句点", "*-一般", "格助詞-自立", "サ変接続-*", "副詞可能-読点", "一般-連体化", "副詞可能-係助詞", "副詞可能-係助詞", "一般-格助詞", "代名詞-係助詞", "一般-連体化", "自立-*", "自立-*", "自立-サ変接続"]
        },
        {
          "type": "integer",
          "attributes": {},
          "value": [0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0]
        },
        {
          "type": "integer",
          "attributes": {},
          "value": [0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1]
        },
        {
          "type": "integer",
          "attributes": {},
          "value": [1, 0, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 1, 0]
        }
      ]
    }

