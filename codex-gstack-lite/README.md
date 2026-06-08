# Codex Gstack Lite

把 `gstack` 里最适合日常编码协作的 4 个能力，整理成一套更轻、更容易接入 `Codex` 的本地 Skill 项目。

当前收口的 4 块：

- `office-hours`
- `plan-eng-review`
- `review`
- `qa`

## 适合谁

适合已经在用 `Codex` 或类似 coding agent，但不想一下子引入整套重框架的人。

这套 lite 版本更强调：

- 先把需求和范围收窄
- 开工前做工程预审
- 交付前固定 review gate
- 用真实证据做 QA 闭环

## 目录结构

```text
codex-gstack-lite/
├─ README.md
├─ LICENSE
├─ install-to-codex.ps1
├─ examples/
│  └─ real-task-scenarios.md
├─ skills/
│  ├─ office-hours/
│  │  └─ SKILL.md
│  ├─ plan-eng-review/
│  │  └─ SKILL.md
│  ├─ review/
│  │  └─ SKILL.md
│  └─ qa/
│     └─ SKILL.md
└─ docs/
   ├─ workflows.md
   └─ verification-samples.md
```

## 四块能力怎么用

### 1. office-hours

用在想法期、需求还散的时候。

目标不是直接写代码，而是回答：

- 值不值得做
- 这轮范围多大
- 哪些不做
- 下一步该进哪条工程流

### 2. plan-eng-review

用在实现前的工程预审。

重点检查：

- 架构边界
- 数据流
- 异常路径
- 边界条件
- 测试口径

### 3. review

用在接近交付时。

它的作用不是重复 code review，而是把“交付前风险收口”固定成一个关卡。

### 4. qa

用在真正结束前。

强调：

- 跑真实入口
- 记录问题
- 分级修复
- 复测闭环
- 留证据

## 推荐顺序

### 新功能 / 新想法

1. `office-hours`
2. `plan-eng-review`
3. 实现
4. `review`
5. `qa`

### 中等改动

1. `plan-eng-review`
2. 实现
3. `review`
4. `qa`

### 单纯交付前检查

1. `review`
2. `qa`

## 安装方式

把 `skills/` 里的目录复制到本地 Codex skill 根目录，例如：

- `~/.codex/skills/`
- 或项目级 `.codex/skills/`

也可以直接运行：

```powershell
powershell.exe -ExecutionPolicy Bypass -File .\install-to-codex.ps1
```

如果要装到自定义目录：

```powershell
powershell.exe -ExecutionPolicy Bypass -File .\install-to-codex.ps1 -TargetRoot "D:\custom\skills"
```

## 边界

这不是完整的 `gstack` 搬运版。

当前有意不包含：

- 仓库级 host / wrapper
- 更重的 runtime 编排
- 与现有 `OpenSpec`、`code-review`、前端工作流重复的整套机制

## 验证

样本见：

- `docs/verification-samples.md`
- `examples/real-task-scenarios.md`

## 后续可扩展

后面可以继续补：

- examples
- checklist
- 更细的 review / qa 模板
- 和 `OpenSpec`、`TDD`、前端工作流的自动路由建议
