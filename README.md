[![](https://images.microbadger.com/badges/image/tsgkadot/imbox-cassandra.svg)](https://microbadger.com/images/tsgkadot/imbox-cassandra "Get your own image badge on microbadger.com")

# Cassandra for IMBox

- Base Image: java:8-jdk-alpine
- Cassandra: 1.1.12
- Authentication: intra-mart simple auth


# 日本語の説明

- intra-mart Accel-PlatformでIMBoxを利用する際に必要となるCassandraのDockerイメージ
- Cassandra公式のDockerイメージでは要求されるバージョンが古すぎるため、存在しないためやむなく自作

> 2015年7月現在のApacheCassandraの最新版は、2.1.8ですが、
> 1.2～2.1は、intra-mart Accel Platformで利用しているCassandraのライブラリがサポートしていないため、
> 現状は、1.1台の最新の1.1.12をご利用ください。

出展: [intra-mart Accel Platform Cassandra管理者ガイド 第14版](http://www.intra-mart.jp/document/library/iap/public/imbox/cassandra_administrator_guide/texts/install/get-cassandra.html)

