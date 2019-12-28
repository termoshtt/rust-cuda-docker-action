# rust-cuda docker action

このアクションは"Hello World"もしくは"Hello" + ログに挨拶する人物名を出力します。

## Inputs

### `who-to-greet`

**必須** 挨拶する相手の名前。 デフォルトは `"World"`。

## 出力

### `time`

挨拶した時間。

## 使用例

```toml
uses: termoshtt/rust-cuda-docker-action@master
with:
  who-to-greet: 'Mona the Octocat'
```
