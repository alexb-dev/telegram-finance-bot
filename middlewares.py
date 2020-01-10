"""Аутентификация — пропускаем сообщения только от одного Telegram аккаунта"""
from aiogram import types
from aiogram.dispatcher.handler import CancelHandler
from aiogram.dispatcher.middlewares import BaseMiddleware


class AccessMiddleware(BaseMiddleware):
    def __init__(self, str_access_ids: str):
        '''
        str_access_ids is a string from list of telegrams ids
        like '1234,234'
        '''
        #convert string to list of ints
        access_ids = list(map(int, str_access_ids.strip().split(',')))
        self.access_ids = access_ids
        #debug:
        print (str_access_ids, access_ids)
        super().__init__()

    async def on_process_message(self, message: types.Message, _):
        if int(message.from_user.id) not in self.access_ids:
            await message.answer("Access Denied")
            raise CancelHandler()
