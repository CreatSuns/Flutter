class Network{
  // 单例公开访问点
  factory Network() =>_sharedInstance();

  // 静态私有成员，没有初始化
  static Network _instance;

  // 私有构造函数
  Network._() {
    // 具体初始化代码
  }

  // 静态、同步、私有访问点
  static Network _sharedInstance() {
    if (_instance == null) {
      _instance = Network._();
    }
    return _instance;
  }
}