## 分支规范

1. master分支：主分支，永远是可用的、稳定的、可直接使用的版本，不能直接在该分支上开发
2. dev：开发主分支，该分支只做合并操作，不能直接在该分支上开发
3. feature-xxx：功能开发分支，在master上创建分支，以开发功能命名完成后合并到develop分支

## Commit规范

提交信息包括两个个字段：

<type>:<subject>

### type: commit 类型

- breaking: 不兼容的改动。接口删除、数据库字段更新等
- feat: 新功能
- fix： 修复bug
- perf: 优化，包括性能提升、体验升级
- refactor： 重构
- docs： 文档调整
- style：格式调整
- test: 测试调整
- chore: 构建过程或者辅助工具的变动
- revert: 回滚到某个版本

### subject: commit的简短描述