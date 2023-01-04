import torch
import torch.nn as nn
import torch.nn.functional as F

from sklearn.datasets import load_iris

iris = load_iris()
print(iris)

##入力値と目標値の抽出
x = iris['data']
t = iris['target']

print(type(x),type(t))

##PytorchのTensor型に変換
x = torch.tensor(x, dtype=torch.float32)
t = torch.tensor(t, dtype=torch.int64)

print(type(x),type(t))

print(x.shape, t.shape) #4input see photo 12/28

#DataLoader
##入力値Xと目標値tをまとめる
dataset= torch.utils.data.TensorDataset(x,t)

##データセットの長さを調べる
print(len(dataset))

print(dataset[0])

##データセット分割
##各データのサンプル数を決定
## train : val : test = 60 % : 20 % : 20%
n_train = int(len(dataset)*0.6)
n_val = int(len(dataset)*0.2)
n_test = len(dataset) - n_train - n_val

print(n_train, n_val, n_test)

##シードの固定
torch.manual_seed(0)

##データセットの分割
train, val, test = torch.utils.data.random_split(dataset, [n_train, n_val, n_test])

print(len(train), len(val), len(test))

#ミニバッチ学習
##バッチサイズの定義
batch_size = 10

train_loader = torch.utils.data.DataLoader(train, batch_size, shuffle=True, drop_last=True)
val_loader = torch.utils.data.DataLoader(val, batch_size)
test_loader = torch.utils.data.DataLoader(test, batch_size)

x,t = next(iter(train_loader))

print(x,t)

#ネットワークの定義
##4->4->3 全結合層を定義
class Net(nn.Module):
    #使用するオブジェクトの定義
    def __init__(self):
        super().__init__()
        self.fc1 = nn.Linear(4,4)
        self.fc2 = nn.Linear(4,3)

    #順伝播
    def forward(self, x):
        h = F.relu(self.fc1(x))
        h = self.fc2(h)
        return h

torch.manual_seed(0)
#ネットワークのインスタンス化
net = Net()
print(net)

#最適化手法
##最急降下法
optimizer = torch.optim.SGD(net.parameters(), lr=0.01)
# ネットワークの定義の完了
batch = next(iter(train_loader))
print(batch)

#x:入力値, t:目標値に分割
x,t = batch
print(x)
print(t)

#パラメーターの値の確認(不要)
#全結合層 fc1 の重みとバイアス
print(f'fc1.weight: {net.fc1.weight}')
print(f'fc1.bias: {net.fc1.bias}')
#全結合層 fc2 の重みとバイアス
print(f'fc2.weight: {net.fc2.weight}')
print(f'fc2.bias: {net.fc2.bias}')

#予測値の計算
y = net.forward(x)
print(y)

#損失関数
loss = F.cross_entropy(y,t)
print(loss)

#全結合層 fc1 の重みとバイアスの勾配
print(f'fc1.weight.grade: {net.fc1.weight.grad}')
print(f'fc1.bias.grade: {net.fc1.bias.grad}')
#全結合層 fc2 の重みとバイアスの勾配
print(f'fc2.weight.grade: {net.fc2.weight.grad}')
print(f'fc2.bias.grade: {net.fc2.bias.grad}')

#勾配の算出

loss.backward()
#全結合層 fc1 の重みとバイアスの勾配
print(f'fc1.weight.grade: {net.fc1.weight.grad}')
print(f'fc1.bias.grade: {net.fc1.bias.grad}')
#全結合層 fc2 の重みとバイアスの勾配
print(f'fc2.weight.grade: {net.fc2.weight.grad}')
print(f'fc2.bias.grade: {net.fc2.bias.grad}')

#パラメーターの更新
optimizer.step()

#パラメーターの値の確認(不要)
#全結合層 fc1 の重みとバイアス
print(f'fc1.weight: {net.fc1.weight}')
print(f'fc1.bias: {net.fc1.bias}')
#全結合層 fc2 の重みとバイアス
print(f'fc2.weight: {net.fc2.weight}')
print(f'fc2.bias: {net.fc2.bias}')

#GPUの使用
#GPUが使用可能か確認
print(torch.cuda.is_available())