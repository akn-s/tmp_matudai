### サンプルファイルの作成
学習用音声ファイルの作成を行います。
soxコンテナを利用して、ノイズを乗せたwavファイルを作成します。  

#### 初回起動時
初回実行時は、soxコンテナをbuildする必要があります。
下記コマンドでコンテナが作成されます。

```
cd ./sox
./build_sox.sh
```

#### ノイズ合成処理
/src/sounds/masters
に学習対象の音を.wavで格納してください。

```
./run_sox.sh
```
コマンドで、/src/souds/masters内のwavファイルに、  
/src/sounds/noisesのノイズを合成して
/src/souds/learning_sampesフォルダに出力します。


