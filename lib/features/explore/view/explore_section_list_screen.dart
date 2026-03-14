import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';
import 'package:mera_history/features/explore/models/explore_hub_data.dart';
import 'package:mera_history/features/explore/models/parallel_timeline_item.dart';
import 'package:mera_history/features/explore/repository/explore_repository.dart';
import 'package:mera_history/features/explore/view/widgets/explore_section_header.dart';
import 'package:mera_history/features/explore/view/widgets/figure_card.dart';
import 'package:mera_history/shared/widgets/empty_state_view.dart';

class ExploreSectionListScreen extends StatelessWidget {
  const ExploreSectionListScreen({super.key, required this.type});

  final String type;

  @override
  Widget build(BuildContext context) {
    final repository = context.read<ExploreRepository>();
    final spacing = context.appSpacing;

    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<ExploreHubData>(
        future: repository.loadHub(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return EmptyStateView(
              title: 'Không thể tải dữ liệu',
              message: snapshot.error.toString(),
              icon: Icons.error_outline,
            );
          }
          final hub = snapshot.data;
          if (hub == null) {
            return const EmptyStateView(
              title: 'Không có dữ liệu',
              message: 'Vui lòng thử lại sau.',
            );
          }
          return ListView(
            padding: EdgeInsets.all(spacing.md),
            children: [
              ExploreSectionHeader(
                title: _titleForType(type),
                subtitle: _subtitleForType(type),
              ),
              SizedBox(height: spacing.md),
              _buildContent(context, hub),
            ],
          );
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, ExploreHubData hub) {
    final spacing = context.appSpacing;
    switch (type) {
      case 'timeline':
        return Column(
          children: hub.dynasties
              .map<Widget>(
                (item) => Padding(
                  padding: EdgeInsets.only(bottom: spacing.sm),
                  child: _DynastyListCard(
                    title: item.name,
                    years:
                        '${_formatYear(item.startYear)} - ${_formatYear(item.endYear)}',
                    capital: item.capital,
                    description: item.description,
                    onTap: () => context.push('/kham-pha/trieu-dai/${item.id}'),
                  ),
                ),
              )
              .toList(),
        );
      case 'parallel':
        return Column(
          children: hub.parallelTimelines
              .map<Widget>(
                (item) => Padding(
                  padding: EdgeInsets.only(bottom: spacing.sm),
                  child: _ParallelTimelineListCard(item: item),
                ),
              )
              .toList(),
        );
      case 'dynasties':
        return Column(
          children: hub.dynasties
              .map<Widget>(
                (item) => Padding(
                  padding: EdgeInsets.only(bottom: spacing.sm),
                  child: _DynastyListCard(
                    title: item.name,
                    years:
                        '${_formatYear(item.startYear)} - ${_formatYear(item.endYear)}',
                    capital: item.capital,
                    description: item.description,
                    onTap: () => context.push('/kham-pha/trieu-dai/${item.id}'),
                  ),
                ),
              )
              .toList(),
        );
      case 'kings':
        return Column(
          children: hub.kings
              .map<Widget>(
                (item) => Padding(
                  padding: EdgeInsets.only(bottom: spacing.sm),
                  child: _KingListCard(
                    name: item.name,
                    dynasty: item.dynastyName,
                    years:
                        '${_formatYear(item.reignStart)} - ${_formatYear(item.reignEnd)}',
                    description: item.shortDescription,
                    image: item.image,
                    onTap: () => context.push('/kham-pha/vua/${item.id}'),
                  ),
                ),
              )
              .toList(),
        );
      case 'figures':
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: hub.figures.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.72,
          ),
          itemBuilder: (context, index) {
            final item = hub.figures[index];
            return ExploreFigureCard(
              figure: item,
              onTap: () {
                if (item.heroId > 0) {
                  context.push('/kham-pha/nhan-vat/${item.heroId}');
                }
              },
            );
          },
        );
      case 'battles':
        return Column(
          children: hub.battles
              .map<Widget>(
                (item) => Padding(
                  padding: EdgeInsets.only(bottom: spacing.sm),
                  child: _BattleListCard(
                    name: item.name,
                    year: _formatYear(item.year),
                    location: item.location,
                    result: item.result,
                    onTap: () => context.push('/kham-pha/tran-danh/${item.id}'),
                  ),
                ),
              )
              .toList(),
        );
      case 'themes':
        return Column(
          children: hub.themes
              .map<Widget>(
                (item) => Padding(
                  padding: EdgeInsets.only(bottom: spacing.sm),
                  child: _ThemeListCard(
                    title: item.title,
                    description: item.description,
                    image: item.coverImage,
                    onTap: () => context.push('/kham-pha/chu-de/${item.id}'),
                  ),
                ),
              )
              .toList(),
        );
      default:
        return const EmptyStateView(
          title: 'Loại danh sách không hợp lệ',
          message: 'Vui lòng quay lại màn khám phá.',
        );
    }
  }

  String _titleForType(String value) {
    return switch (value) {
      'timeline' => 'Dòng thời gian lịch sử',
      'parallel' => 'Dòng thời gian song song',
      'dynasties' => 'Các triều đại Việt Nam',
      'kings' => 'Các vị vua Việt Nam',
      'figures' => 'Nhân vật lịch sử',
      'battles' => 'Các trận đánh nổi bật',
      'themes' => 'Chủ đề lịch sử',
      _ => 'Danh sách',
    };
  }

  String _subtitleForType(String value) {
    return switch (value) {
      'timeline' => 'Toàn bộ giai đoạn lịch sử theo mốc thời gian',
      'parallel' => 'So sánh Việt Nam, Trung Quốc và thế giới',
      'dynasties' => 'Toàn bộ triều đại và thời kỳ lịch sử',
      'kings' => 'Danh sách vua theo triều đại',
      'figures' => 'Nhân vật tiêu biểu qua các thời kỳ',
      'battles' => 'Các trận đánh có ảnh hưởng lớn đến lịch sử',
      'themes' => 'Những chuyên đề lịch sử quan trọng',
      _ => '',
    };
  }

  String _formatYear(int year) => year < 0 ? '${year.abs()} TCN' : '$year';
}

class _DynastyListCard extends StatelessWidget {
  const _DynastyListCard({
    required this.title,
    required this.years,
    required this.capital,
    required this.description,
    required this.onTap,
  });

  final String title;
  final String years;
  final String capital;
  final String description;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.all(spacing.md),
        title: Text(title, style: context.textTheme.titleLarge),
        subtitle: Padding(
          padding: EdgeInsets.only(top: spacing.xs),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(years, style: context.textTheme.titleMedium),
              SizedBox(height: spacing.xxs),
              Text('Kinh đô: $capital', style: context.textTheme.bodyMedium),
              SizedBox(height: spacing.xs),
              Text(
                description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}

class _ParallelTimelineListCard extends StatelessWidget {
  const _ParallelTimelineListCard({required this.item});

  final ParallelTimelineItem item;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final year = item.year;
    String fmt(int value) => value < 0 ? '${value.abs()} TCN' : '$value';

    Widget block(String label, String text) {
      return Padding(
        padding: EdgeInsets.only(bottom: spacing.xs),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: context.textTheme.labelLarge),
            SizedBox(height: spacing.xxs),
            Text(text, style: context.textTheme.bodyMedium),
          ],
        ),
      );
    }

    return Card(
      child: Padding(
        padding: EdgeInsets.all(spacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Năm ${fmt(year)}', style: context.textTheme.titleLarge),
            SizedBox(height: spacing.sm),
            block('Việt Nam', item.vietnam),
            block('Trung Quốc', item.china),
            block('Thế giới', item.world),
            block('Hệ quả', item.impact),
          ],
        ),
      ),
    );
  }
}

class _KingListCard extends StatelessWidget {
  const _KingListCard({
    required this.name,
    required this.dynasty,
    required this.years,
    required this.description,
    required this.image,
    required this.onTap,
  });

  final String name;
  final String dynasty;
  final String years;
  final String description;
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.all(spacing.md),
        leading: CircleAvatar(radius: 28, backgroundImage: NetworkImage(image)),
        title: Text(name, style: context.textTheme.titleLarge),
        subtitle: Padding(
          padding: EdgeInsets.only(top: spacing.xs),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('$dynasty • $years', style: context.textTheme.bodyMedium),
              SizedBox(height: spacing.xs),
              Text(
                description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}

class _BattleListCard extends StatelessWidget {
  const _BattleListCard({
    required this.name,
    required this.year,
    required this.location,
    required this.result,
    required this.onTap,
  });

  final String name;
  final String year;
  final String location;
  final String result;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.all(spacing.md),
        title: Text(name, style: context.textTheme.titleLarge),
        subtitle: Padding(
          padding: EdgeInsets.only(top: spacing.xs),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('$year • $location', style: context.textTheme.bodyMedium),
              SizedBox(height: spacing.xs),
              Text(
                result,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}

class _ThemeListCard extends StatelessWidget {
  const _ThemeListCard({
    required this.title,
    required this.description,
    required this.image,
    required this.onTap,
  });

  final String title;
  final String description;
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(context.appRadius.xl),
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(context.appRadius.xl),
              ),
              child: Image.network(
                image,
                width: double.infinity,
                height: 140,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(spacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: context.textTheme.titleLarge),
                  SizedBox(height: spacing.xs),
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
