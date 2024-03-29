import 'package:supabase_flutter/supabase_flutter.dart';

const String avatarUrl = 'https://source.boringavatars.com/beam/100';
const String supabaseURL = 'https://brnvqnptprafkhiwxtib.supabase.co';
const String supabaseKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJybnZxbnB0cHJhZmtoaXd4dGliIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE2NjMxODQsImV4cCI6MjAyNzIzOTE4NH0._bhXoMjQyv7SSxIDKpl4V1CwPulcWxlkqVv14IBoErg';

final supabase = Supabase.instance.client;
