class Candles {
  num? c;
  num? h;
  num? l;
  num? n;
  num? o;
  num? t;
  num? v;
  num? vw;

  Candles({this.c, this.h, this.l, this.n, this.o, this.t, this.v, this.vw});

  Candles.fromJson(Map<String, dynamic> json) {
    c = json['c'];
    h = json['h'];
    l = json['l'];
    n = json['n'];
    o = json['o'];
    t = json['t'];
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
      v: data['v'],
      vw: data['vw'],
    );
  }
}
