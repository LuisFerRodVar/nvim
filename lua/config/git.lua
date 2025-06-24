-- git init
local function create_git_repo()
	local output = vim.fn.system("git init")
	if vim.v.shell_error == 0 then
		vim.notify(output, vim.log.levels.INFO, { title = "Success" })
	else
		vim.notify(output, vim.log.levels.ERROR, { title = "Error" })
	end
end
vim.keymap.set("n", "<leader>gi", create_git_repo, { desc = "Create a local git repository" })

-- git branch
local function create_git_branch()
	vim.ui.input({ prompt = "Enter new branch name: " }, function(branch)
		if branch == nil or branch == "" then
			vim.notify("Branch name not provided", vim.log.levels.WARN, { title = "Branch" })
			return
		end

		local branches = vim.fn.systemlist("git branch --list")
		if vim.v.shell_error ~= 0 then
			vim.notify("Not a git repository or error listing branches", vim.log.levels.ERROR, { title = "Git" })
			return
		end

		if #branches == 0 then
			local output = vim.fn.system({ "git", "branch", "-M", branch })
			if vim.v.shell_error == 0 then
				vim.notify(
					"Main branch created and renamed to " .. branch,
					vim.log.levels.INFO,
					{ title = "Branch Created" }
				)
			else
				vim.notify(output, vim.log.levels.ERROR, { title = "Error renaming branch" })
			end
		else
			local output = vim.fn.system({ "git", "checkout", "-b", branch })
			if vim.v.shell_error == 0 then
				vim.notify(output, vim.log.levels.INFO, { title = "Branch Created" })
			else
				vim.notify(output, vim.log.levels.ERROR, { title = "Error Creating Branch" })
			end
		end
	end)
end

vim.keymap.set("n", "<leader>gB", create_git_branch, { desc = "Create new git branch" })
-- git commit
local function git_add_commit()
	vim.ui.input({ prompt = "Enter commit message: " }, function(msg)
		if msg == nil or msg == "" then
			vim.notify("Commit message not provided", vim.log.levels.WARN, { title = "Commit" })
			return
		end

		-- git add .
		local add_output = vim.fn.system("git add .")
		if vim.v.shell_error ~= 0 then
			vim.notify(add_output, vim.log.levels.ERROR, { title = "Error in git add" })
			return
		end

		-- git commit -m "message"
		local commit_output = vim.fn.system({ "git", "commit", "-m", msg })
		if vim.v.shell_error == 0 then
			vim.notify(commit_output, vim.log.levels.INFO, { title = "Commit Successful" })
		else
			vim.notify(commit_output, vim.log.levels.ERROR, { title = "Error in git commit" })
		end
	end)
end

vim.keymap.set("n", "<leader>gc", git_add_commit, { desc = "Git add and commit" })

local function create_github_repo()
	local cwd = vim.fn.getcwd()
	local default_name = vim.fn.fnamemodify(cwd, ":t")

	vim.ui.input({ prompt = "Repository name: ", default = default_name }, function(repo_name)
		if not repo_name or repo_name == "" then
			vim.notify("Invalid name", vim.log.levels.WARN)
			return
		end

		vim.ui.select({ "public", "private" }, { prompt = "Repository visibility:" }, function(visibility)
			if not visibility then
				vim.notify("Operation canceled", vim.log.levels.INFO)
				return
			end

			local cmd = {
				"gh",
				"repo",
				"create",
				repo_name,
				"--" .. visibility,
				"--source=.",
				"--remote=origin",
				"--push",
			}

			vim.fn.jobstart(cmd, {
				stdout_buffered = true,
				stderr_buffered = true,
				on_stdout = function(_, data)
					if data then
						vim.notify(table.concat(data, "\n"), vim.log.levels.INFO)
					end
				end,
				on_stderr = function(_, data)
					if data then
						vim.notify(table.concat(data, "\n"), vim.log.levels.ERROR)
					end
				end,
			})
		end)
	end)
end

vim.keymap.set("n", "<leader>gI", create_github_repo, { desc = "Create github repo" })
-- git push
local function git_push()
	local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD"):gsub("\n", "")
	if vim.v.shell_error ~= 0 or branch == "" then
		vim.notify("No se pudo obtener la rama actual", vim.log.levels.ERROR, { title = "Git Push" })
		return
	end

	local output = vim.fn.system({ "git", "push", "origin", branch })
	if vim.v.shell_error == 0 then
		vim.notify(output, vim.log.levels.INFO, { title = "Push Successful" })
	else
		vim.notify(output, vim.log.levels.ERROR, { title = "Error in git push" })
	end
end

vim.keymap.set("n", "<leader>gp", git_push, { desc = "Git push current branch" })

-- git pull
local function git_pull()
	local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD"):gsub("\n", "")
	if vim.v.shell_error ~= 0 or branch == "" then
		vim.notify("No se pudo obtener la rama actual", vim.log.levels.ERROR, { title = "Git Pull" })
		return
	end

	local output = vim.fn.system({ "git", "pull", "origin", branch })
	if vim.v.shell_error == 0 then
		vim.notify(output, vim.log.levels.INFO, { title = "Pull Successful" })
	else
		vim.notify(output, vim.log.levels.ERROR, { title = "Error in git pull" })
	end
end

vim.keymap.set("n", "<leader>gP", git_pull, { desc = "Git pull current branch" })
