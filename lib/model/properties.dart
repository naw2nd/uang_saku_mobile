// To parse this JSON data, do
//
//     final properties = propertiesFromJson(jsonString);

import 'dart:convert';

Properties propertiesFromJson(String str) => Properties.fromJson(json.decode(str));

String propertiesToJson(Properties data) => json.encode(data.toJson());
//masih belum terpakai
class Properties {
    Properties({
        this.properties,
    });

    final PropertiesClass properties;

    factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        properties: PropertiesClass.fromJson(json["properties"]),
    );

    Map<String, dynamic> toJson() => {
        "properties": properties.toJson(),
    };
}

class PropertiesClass {
    PropertiesClass({
        this.page,
        this.total,
        this.totalPage,
        this.pageSize,
        this.hasMorePages,
    });

    final int page;
    final int total;
    final int totalPage;
    final int pageSize;
    final bool hasMorePages;

    factory PropertiesClass.fromJson(Map<String, dynamic> json) => PropertiesClass(
        page: json["page"],
        total: json["total"],
        totalPage: json["total_page"],
        pageSize: json["page_size"],
        hasMorePages: json["has_more_pages"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "total": total,
        "total_page": totalPage,
        "page_size": pageSize,
        "has_more_pages": hasMorePages,
    };
}
