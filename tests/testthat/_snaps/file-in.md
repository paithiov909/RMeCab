# collocate works for a file

    {
      "type": "list",
      "attributes": {
        "class": {
          "type": "character",
          "attributes": {},
          "value": ["RMeCab_collocation", "data.frame"]
        },
        "names": {
          "type": "character",
          "attributes": {},
          "value": ["Term", "Before", "After", "Span", "Total"]
        },
        "row.names": {
          "type": "character",
          "attributes": {},
          "value": ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        }
      },
      "value": [
        {
          "type": "character",
          "attributes": {},
          "value": ["、", "の", "は", "を", "数学", "本", "私", "[[MORPHEMS]]", "[[TOKENS]]"]
        },
        {
          "type": "integer",
          "attributes": {},
          "value": [1, 0, 1, 0, 1, 0, 1, 4, 4]
        },
        {
          "type": "integer",
          "attributes": {},
          "value": [0, 1, 0, 1, 0, 1, 0, 3, 3]
        },
        {
          "type": "integer",
          "attributes": {},
          "value": [1, 1, 1, 1, 1, 1, 1, 7, 7]
        },
        {
          "type": "integer",
          "attributes": {},
          "value": [1, 1, 1, 1, 1, 1, 1, 11, 11]
        }
      ]
    }

# docDF works for directory

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
          "value": ["TERM", "POS1", "POS2", "doc1.txt", "doc2.txt", "doc3.txt"]
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

# docMatrix works for directory

    {
      "type": "integer",
      "attributes": {
        "dim": {
          "type": "integer",
          "attributes": {},
          "value": [10, 3]
        },
        "dimnames": {
          "type": "list",
          "attributes": {
            "names": {
              "type": "character",
              "attributes": {},
              "value": ["terms", "docs"]
            }
          },
          "value": [
            {
              "type": "character",
              "attributes": {},
              "value": ["[[LESS-THAN-1]]", "[[TOTAL-TOKENS]]", "予定", "今日", "数学", "明後日", "明日", "本", "私", "英語"]
            },
            {
              "type": "character",
              "attributes": {},
              "value": ["doc1.txt", "doc2.txt", "doc3.txt"]
            }
          ]
        },
        "class": {
          "type": "character",
          "attributes": {},
          "value": ["xtabs", "table"]
        },
        "call": {
          "type": "language",
          "attributes": {},
          "value": ["xtabs(formula = Freq ~ ., data = do.call(\"rbind\", dummy))"]
        }
      },
      "value": [0, 9, 0, 1, 1, 0, 0, 1, 1, 0, 0, 9, 1, 0, 0, 0, 1, 1, 0, 1, 0, 9, 0, 0, 1, 1, 0, 1, 0, 0]
    }

# docMatrix2 works for directory

    {
      "type": "integer",
      "attributes": {
        "dim": {
          "type": "integer",
          "attributes": {},
          "value": [8, 3]
        },
        "dimnames": {
          "type": "list",
          "attributes": {},
          "value": [
            {
              "type": "character",
              "attributes": {},
              "value": ["予定", "今日", "数学", "明後日", "明日", "本", "私", "英語"]
            },
            {
              "type": "character",
              "attributes": {},
              "value": ["doc1.txt", "doc2.txt", "doc3.txt"]
            }
          ]
        }
      },
      "value": [0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0]
    }

# docNgram works for directory

    {
      "type": "integer",
      "attributes": {
        "dim": {
          "type": "integer",
          "attributes": {},
          "value": [7, 3]
        },
        "dimnames": {
          "type": "list",
          "attributes": {
            "names": {
              "type": "character",
              "attributes": {},
              "value": ["Ngram", "Text"]
            }
          },
          "value": [
            {
              "type": "character",
              "attributes": {},
              "value": ["[今日-私]", "[数学-本]", "[明後日-数学]", "[明日-英語]", "[本-予定]", "[私-数学]", "[英語-本]"]
            },
            {
              "type": "character",
              "attributes": {},
              "value": ["doc1.txt", "doc2.txt", "doc3.txt"]
            }
          ]
        },
        "class": {
          "type": "character",
          "attributes": {},
          "value": ["xtabs", "table"]
        },
        "call": {
          "type": "language",
          "attributes": {},
          "value": ["xtabs(formula = Freq ~ ., data = do.call(\"rbind\", dummy))"]
        }
      },
      "value": [1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0]
    }

# docNgram2 works for directory

    {
      "type": "integer",
      "attributes": {
        "dim": {
          "type": "integer",
          "attributes": {},
          "value": [7, 3]
        },
        "dimnames": {
          "type": "list",
          "attributes": {},
          "value": [
            {
              "type": "character",
              "attributes": {},
              "value": ["[今日-私]", "[数学-本]", "[明後日-数学]", "[明日-英語]", "[本-予定]", "[私-数学]", "[英語-本]"]
            },
            {
              "type": "character",
              "attributes": {},
              "value": ["doc1.txt", "doc2.txt", "doc3.txt"]
            }
          ]
        }
      },
      "value": [1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0]
    }

# Ngram works for a file

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
          "value": ["Ngram", "Freq"]
        },
        "row.names": {
          "type": "character",
          "attributes": {},
          "value": ["1", "2", "3"]
        }
      },
      "value": [
        {
          "type": "character",
          "attributes": {},
          "value": ["[今日-私]", "[数学-本]", "[私-数学]"]
        },
        {
          "type": "integer",
          "attributes": {},
          "value": [1, 1, 1]
        }
      ]
    }

# NgramDF works for a file

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
          "value": ["Ngram1", "Ngram2", "Freq"]
        },
        "row.names": {
          "type": "character",
          "attributes": {},
          "value": ["1", "2", "3"]
        }
      },
      "value": [
        {
          "type": "character",
          "attributes": {},
          "value": ["今日", "数学", "私"]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["私", "本", "数学"]
        },
        {
          "type": "integer",
          "attributes": {},
          "value": [1, 1, 1]
        }
      ]
    }

# NgramDF2 works for directory

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
          "value": ["Ngram1", "Ngram2", "doc1.txt", "doc2.txt", "doc3.txt"]
        },
        "row.names": {
          "type": "character",
          "attributes": {},
          "value": ["1", "2", "3", "4", "5", "6", "7"]
        }
      },
      "value": [
        {
          "type": "character",
          "attributes": {},
          "value": ["今日", "数学", "明後日", "明日", "本", "私", "英語"]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["私", "本", "数学", "英語", "予定", "数学", "本"]
        },
        {
          "type": "integer",
          "attributes": {},
          "value": [1, 1, 0, 0, 0, 1, 0]
        },
        {
          "type": "integer",
          "attributes": {},
          "value": [0, 0, 0, 1, 1, 0, 1]
        },
        {
          "type": "integer",
          "attributes": {},
          "value": [0, 1, 1, 0, 0, 0, 0]
        }
      ]
    }

# RMeCabDoc works for a file

    {
      "type": "character",
      "attributes": {
        "names": {
          "type": "character",
          "attributes": {},
          "value": ["名詞", "名詞", "助詞", "名詞", "助詞", "名詞", "助詞", "動詞", "助動詞"]
        }
      },
      "value": ["今日", "私", "は", "数学", "の", "本", "を", "読む", "だ"]
    }

# RMeCabFreq works for a file

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
          "value": ["Term", "Info1", "Info2", "Freq"]
        },
        "row.names": {
          "type": "character",
          "attributes": {},
          "value": ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11"]
        }
      },
      "value": [
        {
          "type": "character",
          "attributes": {},
          "value": ["だ", "は", "を", "の", "読む", "数学", "本", "私", "今日", "。", "、"]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["助動詞", "助詞", "助詞", "助詞", "動詞", "名詞", "名詞", "名詞", "名詞", "記号", "記号"]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["*", "係助詞", "格助詞", "連体化", "自立", "一般", "一般", "代名詞", "副詞可能", "句点", "読点"]
        },
        {
          "type": "integer",
          "attributes": {},
          "value": [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
        }
      ]
    }

# RMeCabText works for a file

    {
      "type": "list",
      "attributes": {},
      "value": [
        {
          "type": "character",
          "attributes": {},
          "value": ["今日", "名詞", "副詞可能", "*", "*", "*", "*", "今日", "キョウ", "キョー"]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["、", "記号", "読点", "*", "*", "*", "*", "、", "、", "、"]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["私", "名詞", "代名詞", "一般", "*", "*", "*", "私", "ワタシ", "ワタシ"]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["は", "助詞", "係助詞", "*", "*", "*", "*", "は", "ハ", "ワ"]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["数学", "名詞", "一般", "*", "*", "*", "*", "数学", "スウガク", "スーガク"]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["の", "助詞", "連体化", "*", "*", "*", "*", "の", "ノ", "ノ"]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["本", "名詞", "一般", "*", "*", "*", "*", "本", "ホン", "ホン"]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["を", "助詞", "格助詞", "一般", "*", "*", "*", "を", "ヲ", "ヲ"]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["読ん", "動詞", "自立", "*", "*", "五段・マ行", "連用タ接続", "読む", "ヨン", "ヨン"]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["だ", "助動詞", "*", "*", "*", "特殊・タ", "基本形", "だ", "ダ", "ダ"]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["。", "記号", "句点", "*", "*", "*", "*", "。", "。", "。"]
        }
      ]
    }

