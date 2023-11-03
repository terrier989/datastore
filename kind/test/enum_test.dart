// Copyright 2021 Gohilla Ltd.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:kind/kind.dart';
import 'package:test/test.dart';

void main() {
  group('$EnumKind:', () {
    final kind = EnumKind(
      name: 'Example',
      values: Example.values,
    );

    test('== / hashCode', () {
      final object = kind;
      final clone = EnumKind(
        name: 'Example',
        values: Example.values,
      );
      final other0 = EnumKind(
        name: 'OTHER',
        values: Example.values,
      );
      final other1 = EnumKind(
        name: 'Example',
        values: Example.values.skip(1).toList(),
      );

      // a == b
      expect(object, clone);
      expect(object, isNot(other0));
      expect(object, isNot(other1));

      // a.hashCode
      expect(object.hashCode, clone.hashCode);
      expect(object.hashCode, isNot(other0.hashCode));
      expect(object.hashCode, isNot(other1.hashCode));
    });

    test('name', () {
      expect(kind.name, 'Example');
    });

    test('newInstance()', () {
      expect(kind.newInstance(), Example.values.first);
    });

    group('json:', () {
      test('Example.a', () {
        final value = Example.a;
        final json = 'a';
        // Encode
        expect(kind.encodeJsonTree(value), json);
        // Decode
        expect(kind.decodeJsonTree(json), value);
      });
      test('Example.b', () {
        final value = Example.b;
        final json = 'b';
        // Encode
        expect(kind.encodeJsonTree(value), json);
        // Decode
        expect(kind.decodeJsonTree(json), value);
      });
    });
  });
}

enum Example {
  a,
  b,
}
