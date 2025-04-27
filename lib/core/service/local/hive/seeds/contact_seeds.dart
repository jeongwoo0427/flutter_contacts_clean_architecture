
import '../../../../../feature/contact/data/model/contact_hive_model.dart';

final List<ContactHiveModel> contactSeeds = [
  ContactHiveModel(
      id: '1',
      name: '김정우',
      phone: '01072458521',
      email: 'test1@example.com',
      createdAt: DateTime.now(),
      updatedAt: null),
  ContactHiveModel(
      id: '2',
      name: '김지훈',
      phone: '01012345678',
      email: null,
      createdAt: DateTime.now(),
      updatedAt: null),
  ContactHiveModel(
      id: '3',
      name: '오세훈',
      phone: '01000000001',
      email: null,
      createdAt: DateTime.now(),
      updatedAt: null),
  ContactHiveModel(
      id: '4',
      name: '박상현',
      phone: '01000000002',
      email: 'test2@example.com',
      createdAt: DateTime.now(),
      updatedAt: null),
  ContactHiveModel(
      id: '5',
      name: '이수민',
      phone: '01000000003',
      email: null,
      createdAt: DateTime.now(),
      updatedAt: null),
  ContactHiveModel(
      id: '6',
      name: '최지우',
      phone: '01000000004',
      email: 'test3@example.com',
      createdAt: DateTime.now(),
      updatedAt: null),
  ContactHiveModel(
      id: '7',
      name: '강유진',
      phone: '01000000005',
      email: null,
      createdAt: DateTime.now(),
      updatedAt: null),
  ContactHiveModel(
      id: '8',
      name: '김현우',
      phone: '01000000006',
      email: 'test4@example.com',
      createdAt: DateTime.now(),
      updatedAt: null),
  ContactHiveModel(
      id: '9',
      name: '정하늘',
      phone: '01000000007',
      email: null,
      createdAt: DateTime.now(),
      updatedAt: null),
  ContactHiveModel(
      id: '10',
      name: '오유리',
      phone: '01000000008',
      email: 'test5@example.com',
      createdAt: DateTime.now(),
      updatedAt: null),

  // 이후 140개 추가
  for (var i = 11; i <= 150; i++)
    ContactHiveModel(
      id: i.toString(),
      name: '사용자$i',
      phone: '010000000$i',
      email: i % 3 == 0 ? null : 'test${(i % 5) + 1}@example.com',
      createdAt: DateTime.now(),
      updatedAt: null,
    ),
];
