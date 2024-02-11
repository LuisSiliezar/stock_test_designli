class Candles {
  num? c;
  num? h;
  num? l;
  num? n;
  num? o;
  dynamic t;
  num? v;
  num? vw;
  String? x;

  Candles(
      {this.c,
      this.h,
      this.l,
      this.n,
      this.o,
      this.t,
      this.v,
      this.vw,
      this.x});

  Candles.fromJson(Map<String, dynamic> json) {
    c = json['c'];
    h = json['h'];
    l = json['l'];
    n = json['n'];
    o = json['o'];
    t = json['t'];
    x = json['T'];
    v = json['v'];
    vw = json['vw'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['c'] = c;
    data['h'] = h;
    data['l'] = l;
    data['n'] = n;
    data['o'] = o;
    data['t'] = t;
    data['T'] = x;
    data['v'] = v;
    data['vw'] = vw;
    return data;
  }

  factory Candles.fromMap(Map<String, dynamic> data) {
    return Candles(
      c: data['c'],
      h: data['h'],
      l: data['l'],
      n: data['n'],
      o: data['o'],
      t: data['t'],
      x: data['T'],
      v: data['v'],
      vw: data['vw'],
    );
  }
}
