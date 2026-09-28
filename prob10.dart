// Listing 11: Async Operations
// Futures, async/await, Streams, Future.wait(), and Stream operators

// ============================================================
// Problem 1: Future + async/await + Stream Generator
// ============================================================

Future<String> fetchUser() async {
  await Future.delayed(const Duration(seconds: 1));
  return 'User #1024';
}

Stream<int> countStream(int max) async* {
  for (int i = 1; i <= max; i++) {
    await Future.delayed(const Duration(milliseconds: 200));
    yield i;
  }
}

// ============================================================
// Problem 2: Async Database Lookup
// ============================================================

Future<String> fetchUserFromDatabase() async {
  print('Looking up user in database...');

  await Future.delayed(const Duration(seconds: 2));

  return 'User: John, ID: 2048';
}

// ============================================================
// Problem 3: Future.wait()
// Run three asynchronous tasks concurrently
// ============================================================

Future<String> task1() async {
  await Future.delayed(const Duration(seconds: 1));
  return 'Task 1 completed';
}

Future<String> task2() async {
  await Future.delayed(const Duration(seconds: 2));
  return 'Task 2 completed';
}

Future<String> task3() async {
  await Future.delayed(const Duration(seconds: 1));
  return 'Task 3 completed';
}

Future<void> runConcurrentTasks() async {
  final results = await Future.wait([
    task1(),
    task2(),
    task3(),
  ]);

  for (final result in results) {
    print(result);
  }
}

// ============================================================
// Problem 4: Stream Subscription + Timer
// Listen to periodic ticks and cancel after 5 emissions
// ============================================================

Stream<int> periodicTicks() async* {
  int tick = 1;

  while (true) {
    await Future.delayed(const Duration(seconds: 1));
    yield tick++;
  }
}

Future<void> listenToFiveTicks() async {
  int count = 0;

  late StreamSubscription<int> subscription;

  subscription = periodicTicks().listen((value) async {
    print('Tick: $value');

    count++;

    if (count == 5) {
      await subscription.cancel();
      print('Subscription cancelled.');
    }
  });

  // Wait long enough for the five ticks to happen.
  await Future.delayed(const Duration(seconds: 6));
}

// ============================================================
// Problem 5: Stream Operators
// map(), where(), distinct()
// ============================================================

Stream<int> numberStream() async* {
  final numbers = [1, 1, 2, 3, 3, 4, 5, 5, 6];

  for (final number in numbers) {
    await Future.delayed(const Duration(milliseconds: 200));
    yield number;
  }
}

Future<void> transformStream() async {
  numberStream()
      .map((number) => number * 2)
      .where((number) => number > 4)
      .distinct()
      .listen((number) {
    print('Transformed value: $number');
  });

  await Future.delayed(const Duration(seconds: 3));
}

// ============================================================
// Main
// ============================================================

Future<void> main() async {
  // ----------------------------------------------------------
  // Problem 1
  // ----------------------------------------------------------

  print('--- Problem 1 ---');

  final user = await fetchUser();
  print(user);

  print('Counting stream:');

  await for (final number in countStream(5)) {
    print(number);
  }

  // ----------------------------------------------------------
  // Problem 2
  // ----------------------------------------------------------

  print('\n--- Problem 2 ---');

  final databaseUser = await fetchUserFromDatabase();
  print(databaseUser);

  // ----------------------------------------------------------
  // Problem 3
  // ----------------------------------------------------------

  print('\n--- Problem 3 ---');

  await runConcurrentTasks();

  // ----------------------------------------------------------
  // Problem 4
  // ----------------------------------------------------------

  print('\n--- Problem 4 ---');

  await listenToFiveTicks();

  // ----------------------------------------------------------
  // Problem 5
  // ----------------------------------------------------------

  print('\n--- Problem 5 ---');

  await transformStream();
}