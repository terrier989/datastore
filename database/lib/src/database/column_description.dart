// Copyright 2019 terrier989@gmail.com.
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

/// Describes column.
class ColumnDescription implements Comparable<ColumnDescription> {
  final String collectionId;
  final String columnName;

  ColumnDescription({this.collectionId, this.columnName});

  @override
  int get hashCode => collectionId.hashCode ^ columnName.hashCode;

  @override
  bool operator ==(other) =>
      other is ColumnDescription &&
      collectionId == other.collectionId &&
      columnName == other.columnName;

  @override
  int compareTo(ColumnDescription other) {
    {
      final r = collectionId.compareTo(other.collectionId);
      if (r != 0) {
        return r;
      }
    }
    return columnName.compareTo(other.columnName);
  }

  @override
  String toString() {
    if (collectionId == null) {
      return columnName;
    }
    return '$collectionId.$columnName';
  }
}