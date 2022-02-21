import 'package:dio/dio.dart';

const baseUrl = 'https://api.themoviedb.org/3';
const apiKey =
    'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxY2NlN2M0NWQ2ZDY4NTg3NGZkMTBiNzQ5MjYyZTZhZSIsInN1YiI6IjYyMGZlODM0NGY5YTk5MDA0NDI2YjBiNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.KVdeAelq_AMLKxI4R59ITMMsoBeN4lDI72n0kdHH_vk';

final dioOptions = BaseOptions(
  baseUrl: baseUrl,
  connectTimeout: 5000,
  receiveTimeout: 3000,
  contentType: 'application/json;charset=utf-8',
  headers: {'Authorization': 'Bearer $apiKey'},
);
