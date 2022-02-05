# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs

Spending.Repo.insert!(%Spending.Accounts.User{
  name: "Max",
  password:
    "$argon2id$v=19$m=131072,t=8,p=4$jnIqdHnDvsyjQs40ICyA7Q$9wtX3BvKMnbgAhfAVMSMSyz9H3RWbcIyUNhalRVCAU8"
})
